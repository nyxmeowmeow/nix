{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../themes/${theme_trimmed}/colors.nix;
in
{

  programs.ghostty = {
    enable = true;
    settings = {
      font-family = config.stylix.fonts.monospace.name;
      font-size = 22;
      gtk-single-instance = true;

      window-padding-x = 6;
      window-padding-y = 0;
      window-padding-balance = true;

      adjust-cursor-thickness = 2;
      confirm-close-surface = false;

      foreground = lib.mkDefault col.fg;
      background = lib.mkDefault col.bg;
      background-opacity = lib.mkDefault 0.8;
      cursor-color = lib.mkDefault col.fg;
      cursor-text = lib.mkDefault col.bg;
      selection-background = lib.mkDefault col.blue;
      selection-foreground = lib.mkDefault col.bg;

      palette = lib.mkDefault [
        "0=${col.black}"
        "1=${col.red}"
        "2=${col.green}"
        "3=${col.yellow}"
        "4=${col.blue}"
        "5=${col.violet}"
        "6=${col.aqua}"
        "7=${col.white}"
        "8=${col.black}"
        "9=${col.red}"
        "10=${col.green}"
        "11=${col.yellow}"
        "12=${col.blue}"
        "13=${col.violet}"
        "14=${col.aqua}"
        "15=${col.white}"
      ];



      # custom-shader = ../../../stuff/cursor_smear_fade.glsl;

      # cursor smear
#       custom-shader = ''
#
# float getSdfRectangle(in vec2 p, in vec2 xy, in vec2 b)
# {
#     vec2 d = abs(p - xy) - b;
#     return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
# }
#
# // Based on Inigo Quilez's 2D distance functions article: https://iquilezles.org/articles/distfunctions2d/
# // Potencially optimized by eliminating conditionals and loops to enhance performance and reduce branching
#
# float seg(in vec2 p, in vec2 a, in vec2 b, inout float s, float d) {
#     vec2 e = b - a;
#     vec2 w = p - a;
#     vec2 proj = a + e * clamp(dot(w, e) / dot(e, e), 0.0, 1.0);
#     float segd = dot(p - proj, p - proj);
#     d = min(d, segd);
#
#     float c0 = step(0.0, p.y - a.y);
#     float c1 = 1.0 - step(0.0, p.y - b.y);
#     float c2 = 1.0 - step(0.0, e.x * w.y - e.y * w.x);
#     float allCond = c0 * c1 * c2;
#     float noneCond = (1.0 - c0) * (1.0 - c1) * (1.0 - c2);
#     float flip = mix(1.0, -1.0, step(0.5, allCond + noneCond));
#     s *= flip;
#     return d;
# }
#
# float getSdfParallelogram(in vec2 p, in vec2 v0, in vec2 v1, in vec2 v2, in vec2 v3) {
#     float s = 1.0;
#     float d = dot(p - v0, p - v0);
#
#     d = seg(p, v0, v3, s, d);
#     d = seg(p, v1, v0, s, d);
#     d = seg(p, v2, v1, s, d);
#     d = seg(p, v3, v2, s, d);
#
#     return s * sqrt(d);
# }
#
# vec2 norm(vec2 value, float isPosition) {
#     return (value * 2.0 - (iResolution.xy * isPosition)) / iResolution.y;
# }
#
# float antialising(float distance) {
#     return 1. - smoothstep(0., norm(vec2(2., 2.), 0.).x, distance);
# }
#
# float determineStartVertexFactor(vec2 a, vec2 b) {
#     // Conditions using step
#     float condition1 = step(b.x, a.x) * step(a.y, b.y); // a.x < b.x && a.y > b.y
#     float condition2 = step(a.x, b.x) * step(b.y, a.y); // a.x > b.x && a.y < b.y
#
#     // If neither condition is met, return 1 (else case)
#     return 1.0 - max(condition1, condition2);
# }
#
# vec2 getRectangleCenter(vec4 rectangle) {
#     return vec2(rectangle.x + (rectangle.z / 2.), rectangle.y - (rectangle.w / 2.));
# }
# float ease(float x) {
#     return pow(1.0 - x, 3.0);
# }
# vec4 saturate(vec4 color, float factor) {
#     float gray = dot(color, vec4(0.299, 0.587, 0.114, 0.)); // luminance
#     return mix(vec4(gray), color, factor);
# }
#
# const float OPACITY = 0.6;
# const float DURATION = 0.3; //IN SECONDS
#
# void mainImage(out vec4 fragColor, in vec2 fragCoord)
# {
#     fragColor = texture(iChannel0, fragCoord.xy / iResolution.xy);
#     // Normalization for fragCoord to a space of -1 to 1;
#     vec2 vu = norm(fragCoord, 1.);
#     vec2 offsetFactor = vec2(-.5, 0.5);
#
#     // Normalization for cursor position and size;
#     // cursor xy has the postion in a space of -1 to 1;
#     // zw has the width and height
#     vec4 currentCursor = vec4(norm(iCurrentCursor.xy, 1.), norm(iCurrentCursor.zw, 0.));
#     vec4 previousCursor = vec4(norm(iPreviousCursor.xy, 1.), norm(iPreviousCursor.zw, 0.));
#
#     // When drawing a parellelogram between cursors for the trail i need to determine where to start at the top-left or top-right vertex of the cursor
#     float vertexFactor = determineStartVertexFactor(currentCursor.xy, previousCursor.xy);
#     float invertedVertexFactor = 1.0 - vertexFactor;
#
#     // Set every vertex of my parellogram
#     vec2 v0 = vec2(currentCursor.x + currentCursor.z * vertexFactor, currentCursor.y - currentCursor.w);
#     vec2 v1 = vec2(currentCursor.x + currentCursor.z * invertedVertexFactor, currentCursor.y);
#     vec2 v2 = vec2(previousCursor.x + currentCursor.z * invertedVertexFactor, previousCursor.y);
#     vec2 v3 = vec2(previousCursor.x + currentCursor.z * vertexFactor, previousCursor.y - previousCursor.w);
#
#     float sdfCurrentCursor = getSdfRectangle(vu, currentCursor.xy - (currentCursor.zw * offsetFactor), currentCursor.zw * 0.5);
#     float sdfTrail = getSdfParallelogram(vu, v0, v1, v2, v3);
#
#     float progress = clamp((iTime - iTimeCursorChange) / DURATION, 0.0, 1.0);
#     float easedProgress = ease(progress);
#     // Distance between cursors determine the total length of the parallelogram;
#     vec2 centerCC = getRectangleCenter(currentCursor);
#     vec2 centerCP = getRectangleCenter(previousCursor);
#     float lineLength = distance(centerCC, centerCP);
#
#     vec4 newColor = vec4(fragColor);
#
#     vec4 trail = iCurrentCursorColor;
#     trail = saturate(trail, 2.5);
#     // Draw trail
#     newColor = mix(newColor, trail, antialising(sdfTrail));
#     // Draw current cursor
#     newColor = mix(newColor, trail, antialising(sdfCurrentCursor));
#     newColor = mix(newColor, fragColor, step(sdfCurrentCursor, 0.));
#     // newColor = mix(fragColor, newColor, OPACITY);
#     fragColor = mix(fragColor, newColor, step(sdfCurrentCursor, easedProgress * lineLength));
# }
#       '';

    };
  };
}

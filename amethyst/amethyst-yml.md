Fully configuring Amethyst through YAML is not currently possible. Mainly, the
default mappings can not be removed. Additionally, it's a relatively new
feature and still has significant bugs, e.g. some mappings simply don't work.

Below is my configuration for when this feature is available:

```yaml
layouts:
    - column
    - fullscreen
    - middle-wide

window-margins: true
window-margin-size: 8

screen-padding-left: 5
Screen-padding-right: 5
screen-padding-top: 5
screen-padding-bottom: 5

mouse-swaps-windows: true
mouse-resizes-windows: true

mod1:
    - control
mod2:
    - shift
    - control

cycle-layout:
    mod: mod1
    key: e
shrink-main:
    mod: mod2
    key: m
expand-main:
    mod: mod1
    key: m
focus-ccw:
    mod: mod1
    key: l
focus-cw:
    mod: mod1
    key: h
swap-ccw:
    mod: mod2
    key: l
swap-cw:
    mod: mod2
    key: h
```

# component-datepicker

the library come from code [github repo](https://github.com/mymth/vanillajs-datepicker)

## 大小
```css
// z-index 
modal的z-index高于默认的picker的z-index,需要更改为
z-index: calc($zindex-modal + x); x >= 1;
// 设置大小
$dp-cell-size-base: 3.25rem; 
// theme 
因为目前很多颜色是写死的，并没有关联bootstrap5.3的变量上，需要定制一份scss 
对特定的background-color替换为--bs-xxx的值
```


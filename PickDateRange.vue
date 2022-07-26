<template>
    <div ref="refElPickRange" :id="idName" class="position-relative row">
        <div class="col-auto p-0 m-0">
            <a class="btn" disabled v-html="labelFrom"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-start" class="form-control text-center" :class="size" required>
        </div>
        <div class="col-auto p-0 m-0">
            <a class="btn" disabled v-html="labelTo"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-end" class="form-control text-center" :class="size" required>
        </div>
    </div>
</template>
<script>
import { defineComponent, reactive, onMounted, ref } from 'vue'
import Datepicker from './js/Datepicker'
import DateRangePicker from './js/DateRangePicker'
import zhCN from './js/i18n/locales/zh-CN'
export default defineComponent({
    name: 'PickDateRangev5',
    props: {
        labelFrom: {
            type: String,
            default: '',
        },
        labelTo: {
            type: String,
            default: '',
        },
        size: {
            type: String,
            default: '',
        },
        idName: {
            type: String,
            default: 'idPickDateRange',
        },
    },
    emits: ['update'],
    setup(props, ctx) {
        const refElPickRange = ref(null);
        const ud = reactive({
            idEl: props.idName,
            datepicker: null,
        });
        Object.assign(Datepicker.locales, zhCN);
        const initial = () => {                
            ud.datepicker = new DateRangePicker(document.getElementById(ud.idEl), {
                format: 'yyyy-mm-dd',
                language: 'zh-CN',
                buttonClass: 'btn',
            });
            document.querySelectorAll(`#${ud.idEl} input`).forEach((input) => {
                input.addEventListener('changeDate', (event) => {
                    const target = event.target;
                    ctx.emit('update', target.getAttribute('name'), target.value);
                });
            });
        }
        onMounted(() => initial());
        return {
            ud,
        };
    },
});
</script>
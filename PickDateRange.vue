<template>
    <div ref="refElPickRange" :id="props.idName" class="position-relative row">
        <div class="col-auto flex-column justify-content-center p-0 m-0">
            <a class="btn" disabled v-html="props.labelFrom"></a>
        </div>
        <div class="col-auto d-flex flex-column justify-content-center p-0 m-0">
            <input type="text" name="range-start" class="form-control text-center" :class="props.size" required>
        </div>
        <div class="col-auto d-flex flex-column justify-content-center p-0 m-0">
            <a class="btn" disabled v-html="props.labelTo"></a>
        </div>
        <div class="col-auto d-flex flex-column justify-content-center p-0 m-0">
            <input type="text" name="range-end" class="form-control text-center" :class="props.size" required>
        </div>
    </div>
</template>
<script setup>
import { reactive, onMounted, ref } from 'vue';
import Datepicker from './js/Datepicker';
import DateRangePicker from './js/DateRangePicker';
import zhCN from './js/i18n/locales/zh-CN';
const props = defineProps({
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
});
const emit = defineEmits(['update']);
const refElPickRange = ref(null);
const ud = reactive({
    idEl: props.idName,
    datepicker: null,
});
Object.assign(Datepicker.locales, zhCN);
function initial() {                
    ud.datepicker = new DateRangePicker(document.getElementById(ud.idEl), {
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        buttonClass: 'btn',
    });
    document.querySelectorAll(`#${ud.idEl} input`).forEach((input) => {
        input.addEventListener('changeDate', (event) => {
            const target = event.target;
            emit('update', target.getAttribute('name'), target.value);
        });
    });
}
onMounted(() => initial());
</script>
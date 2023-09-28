<template>
    <div ref="elPickRange" class="position-relative row">
        <div class="col-auto p-0 m-0">
            <a class="btn" :class="btnStyle" disabled v-html="labelFrom"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-start" class="form-control text-center" :class="inputStyle" :required="must">
        </div>
        <div class="col-auto p-0 m-0">
            <a class="btn" :class="btnStyle" disabled v-html="labelTo"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-end" class="form-control text-center" :class="inputStyle" :required="must">
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref, computed } from 'vue';
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
    must: {
        type: Boolean,
        default: true,
    },
});
const emit = defineEmits(['update','reset']);
const elPickRange = ref(null);
const datepicker = ref(null);
const btnStyle = computed(()=>{
    if (props.size) return 'btn-'+props.size;
    return '';
})
const inputStyle = computed(()=>{
    if (props.size) return 'form-control-'+props.size;
    return '';
})
Object.assign(Datepicker.locales, zhCN);
const initial = () => {      
    datepicker.value = new DateRangePicker(elPickRange.value, {
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        buttonClass: 'btn',
    });
    elPickRange.value.querySelectorAll('input').forEach((input) => {
        input.addEventListener('changeDate', (event) => {
            const target = event.target;
            emit('update', target.getAttribute('name'), target.value);
        });
    });
}
function reset() {
    elPickRange.value.querySelectorAll('input').forEach((input) => {
        input.value = '';
        emit('reset', input.getAttribute('name'), '');
    });
}
onMounted(() => initial());
defineExpose({
    reset,
});
</script>
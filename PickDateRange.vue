<template>
    <div ref="refElPickRange" class="position-relative row">
        <div class="col-auto p-0 m-0">
            <a class="btn" disabled v-html="labelFrom"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-start" class="form-control text-center" :class="size" :required="must">
        </div>
        <div class="col-auto p-0 m-0">
            <a class="btn" disabled v-html="labelTo"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-end" class="form-control text-center" :class="size" :required="must">
        </div>
    </div>
</template>
<script setup>
import { onMounted, ref } from 'vue';
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
const emit = defineEmits(['update']);
const refElPickRange = ref(null);
const datepicker = ref(null);
Object.assign(Datepicker.locales, zhCN);
const initial = () => {      
    datepicker.value = new DateRangePicker(refElPickRange.value, {
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        buttonClass: 'btn',
    });
    refElPickRange.value.querySelectorAll('input').forEach((input) => {
        input.addEventListener('changeDate', (event) => {
            const target = event.target;
            emit('update', target.getAttribute('name'), target.value);
        });
    });
}
onMounted(() => initial());
defineExpose({

});
</script>
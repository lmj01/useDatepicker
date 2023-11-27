<template>
    <input ref="elInput" type="text" class="form-control date" :class="inputStyle" :required="must">
</template>
<script setup>
import { reactive, onMounted, ref, computed } from 'vue';
import Datepicker from './js/Datepicker';
import zhCN from './js/i18n/locales/zh-CN';
const props = defineProps({
    size: {
        type: String,
        default: '',
    },
    must: {
        type: Boolean,
        default: true,
    }
});
const emit = defineEmits(['value']);
const elInput = ref(null);
const inputStyle = computed(()=>{
    if (props.size) return 'form-control-'+props.size;
    return '';
})
const ud = reactive({
    datepicker: null,
    bk: '',
});
Object.assign(Datepicker.locales, zhCN);
function initial() {        
    ud.datepicker = new Datepicker(elInput.value, {
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        buttonClass: 'btn',
    });
    elInput.value.addEventListener('changeDate', function(event){
        emit('value', event.target.value);
    });
}
function update(value) {
    elInput.value.value = value;
}
function lockDate(isLock) {
    ud.bk = elInput.value.value;
    let newOption = {
        maxDate: null,
        minDate: null,
    }
    if (isLock) {
        let today = new Date();            
        newOption.maxDate = `${today.getFullYear()}-${today.getMonth()+1}-${today.getDate()}`;
        newOption.minDate = `${today.getFullYear()-100}-${today.getMonth()+1}-${today.getDate()}`;
    }
    ud.datepicker.setOptions(newOption);
    elInput.value.value = ud.bk;
}
function setMinDate(options = {}) {
    ud.bk = elInput.value.value;
    let newOption = {
        maxDate: null,
        minDate: null,
    }
    let today = new Date();
    today.setDate(today.getDate() + (options.date || 0));
    today.setMonth(today.getMonth() + (options.month || 0));            
    today.setFullYear(today.getFullYear() + (options.year || 0));            
    newOption.minDate = `${today.getFullYear()}-${today.getMonth()+1}-${today.getDate()}`;
    ud.datepicker.setOptions(newOption);
    elInput.value.value = ud.bk;
}
function setMaxDate(options = {}) {
    ud.bk = elInput.value.value;
    let newOption = {
        maxDate: null,
        minDate: null,
    }
    let today = new Date();
    today.setDate(today.getDate() + (options.date || 0));
    today.setMonth(today.getMonth() + (options.month || 0));            
    today.setFullYear(today.getFullYear() + (options.year || 0));            
    newOption.maxDate = `${today.getFullYear()}-${today.getMonth()+1}-${today.getDate()}`;
    ud.datepicker.setOptions(newOption);
    elInput.value.value = ud.bk;
}
onMounted(() => initial());
defineExpose({
    update,
    lockDate,
    setMinDate,
    setMaxDate,
})
</script>
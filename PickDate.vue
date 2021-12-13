<template>
    <input ref="refElInput" type="text" class="form-control date" required>
</template>
<script>
import { defineComponent, reactive, onMounted, ref } from 'vue';
import Datepicker from './js/Datepicker';
import zhCN from './js/i18n/locales/zh-CN';
export default defineComponent({
    name: 'PickDatev5',
    emits: ['value'], 
    setup(props, ctx) {
        const refElInput = ref(null);
        const ud = reactive({
            datepicker: null,
            bk: '',
        });
        Object.assign(Datepicker.locales, zhCN);
        function initial() {        
            ud.datepicker = new Datepicker(refElInput.value, {
                format: 'yyyy-mm-dd',
                language: 'zh-CN',
                buttonClass: 'btn',
            });
            refElInput.value.addEventListener('changeDate', function(event){
                ctx.emit('value', event.target.value);
            });
        }
        function update(value) {
            refElInput.value.value = value;
        }
        function lockDate(isLock) {
            ud.bk = refElInput.value.value;
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
            refElInput.value.value = ud.bk;
        }
        onMounted(() => initial());
        return {
            ud,
            refElInput,
            update,
            lockDate,
        };
    },
});
</script>
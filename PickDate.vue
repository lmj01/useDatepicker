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
        });
        Object.assign(Datepicker.locales, zhCN);
        const initial = () => {        
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
        onMounted(() => initial());
        return {
            ud,
            refElInput,
            update,
        };
    },
});
</script>
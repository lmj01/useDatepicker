<template>
    <input id="idPickDateInput" type="text" class="form-control date">
</template>
<script>
import { defineComponent, reactive, onMounted } from 'vue'
import Datepicker from './js/Datepicker'
import zhCN from './js/i18n/locales/zh-CN'
export default defineComponent({
  name: 'PickDatev5',
  setup() {
    const ud = reactive({
        datepicker: null,
    })
    Object.assign(Datepicker.locales, zhCN)
    const initial = () => {        
        ud.datepicker = new Datepicker(document.getElementById('idPickDateInput'), {
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            buttonClass: 'btn',
        })
    }
    onMounted(() => initial())
    return {
        ud,
    }
  },
})
</script>
<template>
    <div id="idPickDateRange" class="position-relative row">
        <div class="col-auto p-0 m-0">
            <a class="btn" disabled v-html="labelFrom"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-start" class="form-control text-center">
        </div>
        <div class="col-auto p-0 m-0">
            <a class="btn" disabled v-html="labelTo"></a>
        </div>
        <div class="col-auto p-0 m-0">
            <input type="text" name="range-end" class="form-control text-center">
        </div>
    </div>
</template>
<script>
import { defineComponent, reactive, onMounted } from 'vue'
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
  },
  emits: ['update'],
  setup(props, ctx) {
    const ud = reactive({
        idEl: 'idPickDateRange',
        datepicker: null,
    })
    Object.assign(Datepicker.locales, zhCN)
    const initial = () => {                
        ud.datepicker = new DateRangePicker(document.getElementById(ud.idEl), {
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            buttonClass: 'btn',
        })
        document.querySelectorAll(`#${ud.idEl} input`).forEach((input) => {
            input.addEventListener('changeDate', (event) => {
                const target = event.target
                ctx.emit('update', target.getAttribute('name'), target.value)
            })
        })
    }
    onMounted(() => initial())
    return {
        ud,
    }
  },
})
</script>
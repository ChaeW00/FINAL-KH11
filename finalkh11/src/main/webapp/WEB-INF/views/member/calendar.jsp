<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<style>
    .datepicker table {
        width: 400px;
        height: 300px;
        font-size: 16px;
    }
</style>

    <div class="row" style="margin-top: 150px;" id="app">
		<div class="col mt-4 d-flex container-fluid mt-4 justify-content-center">
			<div>
				<vue-datepicker v-on:click="handleDateClick"></vue-datepicker>
			</div>   
		</div>
	</div>

<script>
const app = Vue.createApp({
	  data() {
	    return {
	      selectedDate: null
	    };
	  },
	  methods: {
	    handleDateClick(date) {
	      this.selectedDate = date;
	    }
	  }
	});

	app.component('vue-datepicker', {
	  template: `
	    <div ref="datepicker" class="datepicker"></div>
	  `,
	  mounted() {
	    $(this.$refs.datepicker).datepicker({
	      beforeShowDay: (date) => {
	        const now = new Date();
	        if (
	          date.getFullYear() === now.getFullYear() &&
	          date.getMonth() === now.getMonth() &&
	          date.getDate() === now.getDate()
	        ) {
	          return { classes: 'text-primary fw-bold' };
	        }
	      },
	      onSelect: (dateText) => {
	        this.$emit('click', dateText); // 클릭된 날짜를 이벤트로 전달
	      }
	    });
	  }
	});

	app.mount("#app");

</script>
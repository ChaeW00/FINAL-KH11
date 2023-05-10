<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
        .carousel-item {
          display: none;
        }
    
        .carousel-item.active {
          display: block;
        }
      </style>

    <div class="container-fluid mt-4">

        <div class="row">
            <div class="offset-md-2 col-md-8">

                <!-- 슬라이드 (slide) -->
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="https://via.placeholder.com/940x320?text=1" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://via.placeholder.com/940x320?text=2" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="https://via.placeholder.com/940x320?text=3" class="d-block w-100" alt="...">
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>
  
        </div>
      </div>
    </div>
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.bundle.min.js"></script>
      </script>

                <!-- 
                    테이블
                    - 주 클래스 - .table
                    - 부 클래스
                        - .table-bordered                   
                        - .table-striped
                        - .table-hover
                 -->
                
                <div class="row mt-4">
                    <div class="col">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>매치 시간</th>
                                    <th>매치 정보</th>
                                    <th>매치 상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>11:00</td>
                                    <td>[6vs6] 너만 오면 고!</td>
                                    <td><button class="" disabled>마감</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row mt-4" id="paging">
                    <div class="col d-flex justify-content-center align-items-center">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#">&laquo;</a>
                            </li>
                            <li class="page-item" v-for="index in (end-begin+1)" :key="index"
                                    v-bind:class="{active:(index+begin-1) == page}">
                                <a class="page-link" href="#"
                                    v-on:click.prevent="page = index+begin-1">{{index+begin-1}}</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">&raquo;</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <script src="https://unpkg.com/vue@3.2.36"></script>
                <script>
                    Vue.createApp({
                        data(){
                            return {
                                page:15,
                                begin:11,
                                end:20,
                            };
                        },
                    }).mount("#paging");
                </script>

            </div>
        </div>

        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
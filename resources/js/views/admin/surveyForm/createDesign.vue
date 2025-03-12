<template>
  <create-form @onSubmit='submit'>
    <div class="col-lg-12">
    <Fieldset>
      <template v-slot:name>Form</template>
      <template v-slot:content>
        <Select title="Project" field="data.role_id" :req="true" v-model="data.role_id" label="name"
        :reduce="(obj) => obj.id" :options="[]" placeholder="--Select One--" :closeOnSelect="true" col="3" />

        <Select title="Project Indicator" field="data.role_id" :req="true" v-model="data.role_id" label="name"
        :reduce="(obj) => obj.id" :options="[]" placeholder="--Select One--" :closeOnSelect="true" col="3" />

        <Select title="Project Activity" field="data.role_id" :req="true" v-model="data.role_id" label="name"
        :reduce="(obj) => obj.id" :options="[]" placeholder="--Select One--" :closeOnSelect="true" col="3" />

        <Input v-model='data.title' field='data.title' title='Title' :req='true' col="3" />

        <Switch v-model='data.status' field='data.status' title='Status' on-label='Active' off-label='Deactive'
        :req='true'>
        </Switch>

          <h5 class="mb-3"><u>Questions:</u></h5>
          <div class="d-flex flex-column gap-3 mt-0 w-100">
            <div class="q_box d-flex gap-3 align-items-center w-100">
              <div class="q_item p-3 w-100">
                <div class="question d-flex gap-3 justify-content-between">
                  <p><span>1. </span> Have you experienced improved access to essential resources (such as seeds, water, and farming tools) for sustainable agriculture since joining the project?</p>
                  <input type="text" placeholder="mark">
                </div>
                <label for="" class="form-label mt-2">Answer</label>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                      <button type="button" class="btns add_more"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Add" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M12 5l0 14" />
                              <path d="M5 12l14 0" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="icon">
                <div class="multiple_fields_actions_btn d-flex flex-column align-items-center gap-2">
                  <button type="button" class="btns delete_one"
                      data-bs-toggle="tooltip" data-bs-placement="top"
                      data-bs-title="Delete" v-x-tooltip>
                      <svg xmlns="http://www.w3.org/2000/svg" width="24"
                          height="24" viewBox="0 0 24 24" fill="none"
                          stroke="currentColor" stroke-width="2"
                          stroke-linecap="round" stroke-linejoin="round"
                          class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M4 7l16 0" />
                          <path d="M10 11l0 6" />
                          <path d="M14 11l0 6" />
                          <path
                              d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                          <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                      </svg>
                  </button>
                  <button type="button" class="btns add_more"
                      data-bs-toggle="tooltip" data-bs-placement="top"
                      data-bs-title="Add" v-x-tooltip>
                      <svg xmlns="http://www.w3.org/2000/svg" width="24"
                          height="24" viewBox="0 0 24 24" fill="none"
                          stroke="currentColor" stroke-width="2"
                          stroke-linecap="round" stroke-linejoin="round"
                          class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M12 5l0 14" />
                          <path d="M5 12l14 0" />
                      </svg>
                  </button>
                </div>
              </div>
            </div>
            <div class="q_box d-flex gap-3 align-items-center w-100">
              <div class="q_item p-3 w-100">
                <div class="question d-flex gap-3 justify-content-between">
                  <p><span>2. </span> How satisfied are you with the quality and availability of the resources provided for sustainable agriculture through the project?</p>
                  <input type="text" placeholder="mark">
                </div>
                <label for="" class="form-label mt-2">Answer</label>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                      <button type="button" class="btns add_more"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Add" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M12 5l0 14" />
                              <path d="M5 12l14 0" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="icon">
                <div class="multiple_fields_actions_btn d-flex flex-column align-items-center gap-2">
                  <button type="button" class="btns delete_one"
                      data-bs-toggle="tooltip" data-bs-placement="top"
                      data-bs-title="Delete" v-x-tooltip>
                      <svg xmlns="http://www.w3.org/2000/svg" width="24"
                          height="24" viewBox="0 0 24 24" fill="none"
                          stroke="currentColor" stroke-width="2"
                          stroke-linecap="round" stroke-linejoin="round"
                          class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M4 7l16 0" />
                          <path d="M10 11l0 6" />
                          <path d="M14 11l0 6" />
                          <path
                              d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                          <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                      </svg>
                  </button>
                  <button type="button" class="btns add_more"
                      data-bs-toggle="tooltip" data-bs-placement="top"
                      data-bs-title="Add" v-x-tooltip>
                      <svg xmlns="http://www.w3.org/2000/svg" width="24"
                          height="24" viewBox="0 0 24 24" fill="none"
                          stroke="currentColor" stroke-width="2"
                          stroke-linecap="round" stroke-linejoin="round"
                          class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M12 5l0 14" />
                          <path d="M5 12l14 0" />
                      </svg>
                  </button>
                </div>
              </div>
            </div>
            <div class="q_box d-flex gap-3 align-items-center w-100">
              <div class="q_item p-3 w-100">
                <div class="question d-flex gap-3 justify-content-between">
                  <p><span>3. </span> What type of resources have been most beneficial to you for improving your agricultural practices? (Select all that apply)</p>
                  <input type="text" placeholder="mark">
                </div>
                <label for="" class="form-label mt-2">Answer</label>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
                <div class="answer_box gap-3 d-flex align-items-center mb-3">
                  <Input v-model='data.title' field='data.title' :req='false' col="8 col-xl-9" placeholder="type answer" />
                  <input type="text" placeholder="mark" class="col-2">
                  <div class="icon">
                    <div class="multiple_fields_actions_btn d-flex align-items-center gap-2">
                      <button type="button" class="btns delete_one"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                              data-bs-toggle="tooltip" data-bs-placement="top"
                              data-bs-title="Delete" v-x-tooltip>
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M4 7l16 0" />
                              <path d="M10 11l0 6" />
                              <path d="M14 11l0 6" />
                              <path
                                  d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                          </svg>
                      </button>
                      <button type="button" class="btns add_more"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Add" v-x-tooltip>
                          <svg xmlns="http://www.w3.org/2000/svg" width="24"
                              height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2"
                              stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                              <path d="M12 5l0 14" />
                              <path d="M5 12l14 0" />
                          </svg>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="icon">
                <div class="multiple_fields_actions_btn d-flex flex-column align-items-center gap-2">
                  <button type="button" class="btns delete_one"
                      data-bs-toggle="tooltip" data-bs-placement="top"
                      data-bs-title="Delete" v-x-tooltip>
                      <svg xmlns="http://www.w3.org/2000/svg" width="24"
                          height="24" viewBox="0 0 24 24" fill="none"
                          stroke="currentColor" stroke-width="2"
                          stroke-linecap="round" stroke-linejoin="round"
                          class="icon icon-tabler icons-tabler-outline icon-tabler-trash"
                          data-bs-toggle="tooltip" data-bs-placement="top"
                          data-bs-title="Delete" v-x-tooltip>
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M4 7l16 0" />
                          <path d="M10 11l0 6" />
                          <path d="M14 11l0 6" />
                          <path
                              d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
                          <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
                      </svg>
                  </button>
                  <button type="button" class="btns add_more"
                      data-bs-toggle="tooltip" data-bs-placement="top"
                      data-bs-title="Add" v-x-tooltip>
                      <svg xmlns="http://www.w3.org/2000/svg" width="24"
                          height="24" viewBox="0 0 24 24" fill="none"
                          stroke="currentColor" stroke-width="2"
                          stroke-linecap="round" stroke-linejoin="round"
                          class="icon icon-tabler icons-tabler-outline icon-tabler-plus">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                          <path d="M12 5l0 14" />
                          <path d="M5 12l14 0" />
                      </svg>
                  </button>
                </div>
              </div>
            </div>
          </div>

      </template>
    </Fieldset>
  </div>
  </create-form>
</template>

<script>


const model = 'surveyForm';

export default {

  data() {
    return {
      model: model,
      page_title: '',
      data: {},

    };
  },

  provide() {
    return {
      validate: this.validation,

    };
  },
  methods: {
    submit: function (e) {
      this.$validate().then((res) => {
        const error = this.validation.countErrors();

        if (error > 0) {
          console.log(this.validation.allErrors());
          this.$toast(
            'You need to fill ' + error + ' more empty mandatory fields',
            'warning'
          );
          return false;
        }

        if (res) {


          if (this.data.id) {
            this.update(this.model, this.data, this.data.id);
          } else {
            this.store(this.model, this.data);
          }
        }
      });
    },
  },
  created() {
    if (this.$route.params.id) {
      this.page_title = this.headline(this.model) + ' Edit';
      this.get_data(`${this.model}/${this.$route.params.id}`);
    } else {
      this.page_title = this.headline(this.model) + ' Create';
    }
  },

  validators: {
    'data.title': function (value = null) { return Validator.value(value).required('Title is required'); },

  },
}

</script>

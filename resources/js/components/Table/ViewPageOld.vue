<template>
  <div class="content-part">
    <div v-if="!$root.spinner" class="inner-content">
      <div class="global-form">
        <div class="global-form-header">
          <div class="row">
            <!-- search form -->
            <div class="col-lg-10">
              <slot name="header"></slot>
            </div>
            <!-- search form -->

            <!-- add or back button -->
            <slot name="button">
              <AddOrBackButton
                v-if="button"
                :route="$parent.model + '.index'"
                :portion="$parent.model"
                :icon="'fas fa-backward'"
              />
            </slot>
            <!-- add or back button -->

            <!-- <slot name="custom_header">
              <div class="w-100 mt-3">
                <div class="top--title mt-2">
                  <h4>Album: {{ data?.name }}</h4>
                </div>
              </div>
            </slot> -->

            <slot name="custom_design"></slot>
          </div>
        </div>

        <div class="form-input-details">
          <ViewBaseTable
            v-if="defaultTable"
            :data="$parent.data"
            :extra_row="$parent.extra_row"
            :fields="$parent.fields"
            :belongs_to="$parent.belongs_to"
            :fileColumns="$parent.fileColumns"
          />
          <slot></slot>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    button: {
      type: Boolean,
      default: true,
    },
    defaultTable: {
      type: Boolean,
      default: true,
    },
    header: {
      type: String,
      default: "",
    },
  },
};
</script>

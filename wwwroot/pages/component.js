Vue.component("banner", {
  template: "#my-banner",
  props: { source: [] },
  data: function () {
    return {
      show: false,
    };
  },
  created: function () {
      console.log('my-banner',this.source);
  },
  methods: {
    onClick(val) {
      console.log("click");
    },
  },
});

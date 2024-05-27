module.exports = () => ({
  upload: {
    config: {
      provider: "aws-s3",
      providerOptions: {
        credentials: {
          accessKeyId: "AKIAQ3EGVXS6VQVI4PF7",
          secretAccessKey: "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",
        },
        region: "eu-west-1",
        params: {
          Bucket: "ecommerce-strapii",
        },
      },
    },
  },
});

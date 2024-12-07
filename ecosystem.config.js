module.exports = {
    apps: [
      {
        name: "nextjs",
        script: "npm",
        args: "run dev",
        watch: false,
      },
      {
        name: "pocketbase",
        script: "./pocketbase",
        args: "serve --http=0.0.0.0:8090",
        watch: false,
      },
    ],
  };
  
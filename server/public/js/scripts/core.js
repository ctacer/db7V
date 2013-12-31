
$ (function () {
    templateBuilder.initialize(config, function () {
        mainController.initialize (config);
        treeViewController.initialize (config);
        dbManager.initialize (config);
    });
});
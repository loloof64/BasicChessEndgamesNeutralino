const path = require('path');

// Require bundler
const { Bundler } = require('neutralino-appimage-bundler');

// Create an object with some params
const bundler = new Bundler({
    // .desktop file properties
    desktop: {
        // Name field
        name: 'BasicChessEndgames',

        // Path to the icon
        icon: path.join(__dirname, 'frontend/public/icon.png'),

        // Categories (default is Utilities)
        categories: ['Game']
    },

    // Neutralino binary info
    binary: {
        // Name of the binary (cli.binaryName)
        name: 'basic-chess-endgames',

        // Dist folder path
        dist: path.join(__dirname, 'dist')
    },

    // Some files or folders to copy inside of the the AppImage
    copy: {
        'public': path.join(__dirname, 'frontend/public')
    },

    // Should AppImage contain Neutralino's dependencies or not
    // If true, then AppImage will contain binary's shared libraries
    includeLibraries: true,

    // Path to the appimage to save
    output: path.join(__dirname, 'BasicChessEndgames.AppImage'),

    /**
     * (optional) If set to true, the AppImage will run only with root privileges
     */
    sudo: false,

    // Application version
    version: '0.1.0'
});

// Bundle project
bundler.bundle();
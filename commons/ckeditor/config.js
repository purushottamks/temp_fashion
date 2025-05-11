/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
// ...
    var base_url = 'app';
    config.filebrowserBrowseUrl = '../'+base_url+'/commons/kcfinder/browse.php?opener=ckeditor&type=files';
    config.filebrowserImageBrowseUrl = '../'+base_url+'/commons/kcfinder/browse.php?opener=ckeditor&type=images';
    config.filebrowserFlashBrowseUrl = '../'+base_url+'/commons/kcfinder/browse.php?opener=ckeditor&type=flash';
    config.filebrowserUploadUrl = '../'+base_url+'/commons/kcfinder/upload.php?opener=ckeditor&type=files';
    config.filebrowserImageUploadUrl = '../'+base_url+'/commons/kcfinder/upload.php?opener=ckeditor&type=images';
    config.filebrowserFlashUploadUrl = '../'+base_url+'/commons/kcfinder/upload.php?opener=ckeditor&type=flash';
    config.allowedContent = true;
    ///config.extraPlugins = 'video';
// ...
};

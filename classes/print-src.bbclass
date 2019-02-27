###################################################################################################
# This class is used to track all the download URLs for the packages. It creates a CSV file
# containing the package name, version, and URL for the download.
#
# This file is an adaptation of lukaszgard solution provided in stackoverflow:
#
# https://stackoverflow.com/questions/50345536/listing-src-uri-of-all-packages-files-needed-to-build-yocto-image?rq=1
#
# Additional Notes:
# - 'file' URLs are ignored.
# - Fetcher parameters are also included in the URL.
# - This only pulls what is downloaded not necessarily what is packaged with an image. You can
#   run the following command to pull the image's package:
#       bitbake -g <image> && cat pn-depends.dot | grep -v -e '-native' | grep -v digraph | grep -v -e '-image' | awk ####################################################################################################

python do_print_src () {
        uri = d.getVar('SRC_URI', True).split()
        package = d.getVar('PN', True)
        version = d.getVar('PV', True)
        urlList = list()
        for st in uri:
                if not st.startswith("file:"):
                        urlList.append("\"{0}\",\"{1}\",\"{2}\"\n".format(package,version,st))
        with open("source_urls.csv", "a") as logFile:
                logFile.writelines(urlList);
}

addtask do_print_src before do_fetch


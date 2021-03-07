# How I draft once and then convert to different nasins sitelen

If anyone's interested :)

## 1. Set up Atom

To make the Toki Pona fonts work with the Markdown Previewer in Atom, you need to edit the styles.less file. See the .atom subfolder.

## 2. Drafting

Add a span tag (<span class="lp>) at the top of the page to make sitelen pona show up in the Markdown Preview tool. The converter will remove this and insert the correct span tags for each nasin sitelen.

The converter relies on you following certain rules when you draft:

- Use BLOCK CAPS for foreign words, add foreign words to _tpforeignwords.txt which is in the rxrepl folder (see below)
- Use “+” for compounds and long pi, escape real + with \\+. The converter is built around this to avoid messing up the minus signs in URLs.
-	Use default tags (<span class="lpdef”> … </span>) for elements that must remain in Latin script. It is also highly recommended to use \&nbsp; where there must be space.
-	Use “_LANGCODE” for internal site links. This blog is set up so that the address of each page ends with an underscore followed by a "language" code for the nasin sitelen. For example: lipu-sin_spp is the sitelen pona pona version of "lipu-sin"

If you draft with Markdown Preview open you can check in real time to see if your compounds will look good:

![drafting](https://joelthomastr.github.io/tokipona/behind-the-scenes/drafting-in-atom.jpg)

There's more information on the test page [lipu pi open pali](https://joelthomastr.github.io/tokipona/lipu-pi-open-pali_en)

## 3. Converting

Conversion happens inside the rxrepl folder.

1. Copy and paste into _INPUT
2. Run \___RUN-ALL.bat
3. Make copies of the page you were drafting with the correct underscore and language code combination at the end. For example copy from _OUTPUT-SI to lipu-sin_si.
4. Make a page with an English code for the translation, for example lipu-sin_en, and copy from _OUTPUT-EN into it. This is only to get you started, because of course this is a translation and must be done manually

I've tried to make everything as self-explanatory and flexible as possible in rxrepl. The structure.txt file documents most things. ReadMe is the readme file for the rxrepl.exe tool that the converter is built around.

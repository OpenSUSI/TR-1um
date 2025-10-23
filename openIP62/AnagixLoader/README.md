# Anagix Loader

This package is required by all of our PDKs for KLayout.
Our PDK packages (NDA free one is OpenRule1um) requires MinedaCommon.rb and MinedaPCell.rb defined in this repository. Because macro files under KLayout (.lym files) are loaded in an alphabetical order (seems like so), this package (AnagixLoader) is expected to be loaded first. loader.lym requires MinedaCommon and MinedaPCell. MinedaPCell.rb is a common open source part of PCell used in various PCells code. 

Our PDKs utilize Open PDK technology presented at SASIMI 2022 under the title "An NDA-free Oriented Open PDK
Technology and EDA for Small Volume LSI Developments".
https://tsys.jp/sasimi/2022/program/program_abst.html#C-4

Feel free to use this package to develop your own PDK. Please take a look at the OpenRule1um PDK and use it
as a basis for your development.

## Anagix Loader installation
Because AnagixLoader is installed as a package in KLayout, please clone this repository under 
the "salt" directory (~/.klayout/salt for Linux and Mac, ~/KLayout/salt for Windows).

For more details, please follow instructions in the appropriate PDK Users's manual:
https://www.dropbox.com/scl/fi/dyfb149804js9yqocoep0/OpenRule1um-v2-PDKv0.3.paper?rlkey=79z8g5id6cnem7vga39yy2t8h&dl=0

## License
Anagix Loader is released under the Apache 2.0 license.

The copyright details are:

Copyright 2023 Seijiro Moriyama (Anagix Corporation)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Author
Seijiro Moriyama (seijiro.moriyama@anagix.com)

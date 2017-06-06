Specifications for remediating and processing Smith SC EAD may be found here: [sc_ead-specifications](https://docs.google.com/a/smith.edu/spreadsheets/d/13QDuQZnGBNV0gqr6gzy6yRNtlZCfN9usJNgY6FVxHIM/edit?usp=sharing). To see information about manual updates, etc., check the spreadsheet. Specific decisions by element are below:

#######Decisions by element

| Element       | Decision      |
| ------------- |--------------|
| publicationstmt/p | Enter ''Copyright to this finding aid has been given to the public domain via the use of a Creative Commons CC0 1.0 Public Domain Dedication' in place of existing content.|
| archdesc @level | For most files, @level="collection". Exception: files that start with mnsss292 -- @level="recordgrp". Files that start with mnsss148s -- @level="series". |
| archdesc/unittitle | For files with mnsss in filename, replace titles in this field with titles in this document: http://bit.ly/2pAj5dF. Match on EADID. For files with manosca and manoscmr in filename, replace "Records" with "records", "Papers" with "papers", and "Collection" with "collection". |
| archdesc/extent | First extent in EAD: numeric character is entered in number field. If first extent's measurement in EAD = boxes, enter boxes in ASpace type. If first extent's measurement in EAD = linear feet / linear ft., enter "Linear Feet" in ASpace type. Second extent in EAD is mapped to container summary. |
| archdesc/langmaterial | Language subelement is entered, where missing in langmaterial element. |
| archdesc/bioghist/head | Remove head subelement. |
| archdesc/scopecontent/head | Remove head subelement. |
| archdesc/arrangement/head | Remove head subelement. |
| arcdesc/descgrp  | Remove descgrp element and retain content inside (accessrestrict, userestrict, processinfo, prefercite, altformavail, acqinfo, accruals, custodhist) |
| did/note | Change to <didnote> |
| dsc @type="analyticcover"/c01 | Match c01s in analyticover dsc and in-depth dsc by unittitle. Copy over unittitle, extent, unitdate, arrangement, scopecontent from c01s in analyticover dsc to in-depth c01s. Where multiple unittitle, use unittitle from in-depth dsc. Where multiple, matching (as in equal) extent and unitdate, use extent and unitdate in analyticover dsc. Where multiple, non-matching extent and unitdate, keep both for repeatable extent or date. The unitdates we are likely to come across in both the analyticover and in-depth dsc will either be a range or a range + n.d./single date in a single unitdate. It will always be an expression and not a normalized date. Equal means that the expression is identical. |
| unitdate | Where exists, update dates with the following to circa, followed by date info: "c.", "c", "ca", "ca.". Where exists, update dates with following to undated: "n.d.", "nd". When dates are in parentheses, remove the parentheses and retain date information. |
| c/did/note | Change <note> in <c><did> to <c><didnote>. Remove @href or @target and leave content of the note. |
| c/did/note/ref | Change <note> in <c><did> to <c><didnote>. Remove ref subelement. Retain content in ref element in the <didnote> field. |
| archdesc/scopecontent/chronlist | Keep chronlist in respective field and test ingest as is. If ingest fails, determine another solution. |
| archdesc/bioghist/chronlist | Keep chronlist in respective field and test ingest as is. If ingest fails, determine another solution. |
| archdesc/index | Pull out content from index and save as text file. Retain EADID for later integration. |
| archdesc/odd | Pull out appendix content from odd and save as text file. Retain EADID for later integration. |
|   |   |
|   |   |
|   |   |
|   |   |
|   |   |

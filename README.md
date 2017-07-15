# aspace-data-remediation
Files, tools, and plans for remediating data for migration to ArchivesSpace at Smith.

The scope of the project is as follows:

**Data cleanup and processing**
- [ ] single-level resource records (*minor revisions to processor need to be applied*) \(EAD) 
- [ ] single-level resource records (*cleanup complete*) \(InMagic resource records)
- [ ] multi-level resource records (*minor revisions to processor need to be applied*) \(EAD)
- [ ] accession records (*cleanup complete*)
- [ ] agent records \(*in process*)
- [ ] top containers \(*in process*)
- [ ] reconciliation of subjects (to LCSH, AAT, and TGN) \(*depending on timeline, this may need to be pushed out of scope*)
- [ ] merge duplicate names and subjects \(*depending on timeline, this may need to be pushed out of scope*)
- [X] normalization of dates (*solution implemented*)

**Post records to prod**
- [ ] single-level resource records \(EAD and InMagic resource records)
- [ ] multi-level resource records \(EAD)
- [ ] accession records
- [ ] agent records
- [ ] top containers
- [ ] container profiles
- [ ] locations
- [ ] classifications

**Other**
- [ ] recommend solutions for item-level archival objects (images, AV, and objects) described out of context from parent collections
- [ ] training


### ACCESSION RECORD SPECIFICATIONS
[SCA accession JSON mapping](https://docs.google.com/a/smith.edu/spreadsheets/d/15FH8crZdmMBQC5hdMlvfAq39qYH_MlA0mlMfe8_QpP8/edit?usp=sharing)

[SCA accession data](https://docs.google.com/a/smith.edu/spreadsheets/d/1dZ-hHBhSAKpKUCBereJhhoLBICtyTZXpbTi-euH4mj4/edit?usp=sharing)

[SSC accession JSON mapping](https://docs.google.com/a/smith.edu/spreadsheets/d/1yIzDbvAS_hQjOywsNexMESoIQNBCz2oXlykEsaoLmkY/edit?usp=sharing)

[SSC accession data](https://docs.google.com/a/smith.edu/spreadsheets/d/12gRyw0CcjafSPmB4zvC6NF0WDWW05yhCSTqpnc05xu8/edit?usp=sharing)


### RESOURCE RECORD SPECIFICATIONS
[SSC resource JSON mapping](https://docs.google.com/a/smith.edu/spreadsheets/d/1ULmNGHuKJMMgj8zCymQznoBjuA_jiHct99zLeq1ciLI/edit?usp=sharing)

[SSC resource data](https://docs.google.com/a/smith.edu/spreadsheets/d/1n1-qjVFxi0FTsBbaav4aB2kO7vMrNsUhpG-5qN2taxk/edit?usp=sharing)

[MRBC resource data *identifiers*](https://docs.google.com/a/smith.edu/spreadsheets/d/1dpe1jQgt4PQp_pndf8V2cdLCkzI4qUx6deCWc3E7J1c/edit?usp=sharing)


### AGENT RECORD SPECIFICATIONS
[SCA agent data JSON mapping](https://docs.google.com/spreadsheets/d/13Hs30SmUP4E-YrxmGXI48dx-YvxDWCrtxesGSknKxLo/edit#gid=310677041)

[SCA faculty agent data](https://docs.google.com/a/smith.edu/spreadsheets/d/1otZqGC517oFVCYPAxx7EXLQkz8it0V5BqYVfPXP9wCw/edit?usp=sharing)

[SCA alumnae agent data](https://docs.google.com/a/smith.edu/spreadsheets/d/1CJNbVk4ttJTCwvHMiRzFkPTTIjO0G4xP1vBbaw2OeZs/edit?usp=sharing)

[SCA alumnae memorial agent data](https://docs.google.com/a/smith.edu/spreadsheets/d/1CVxEDzn7vSPWlSFEwpE4UgDz4LUse9JOjkhb4qBBQoU/edit?usp=sharing)

[SCA source agent data](https://docs.google.com/a/smith.edu/spreadsheets/d/1s9xGUBROTN_CZgIn_zVHWY_MRL54VNUPmdQckM9a3Bk/edit?usp=sharing)


[SSC Sample Agent Data + JSON mapping](https://docs.google.com/spreadsheets/d/1ZrLrGFD2-bWyclsfojssTd5BQU47Iv5SELqd-urx0UU/edit#gid=0)


### CONTAINER AND LOCATION RECORD SPECIFICATIONS
[SSC Young 219 container data sample + JSON mapping](https://docs.google.com/a/smith.edu/spreadsheets/d/1d4FaOoGwxMdjrdvdBP61h1O8BQZTR7UYG1B1MSVgoTM/edit?usp=sharing)


### SCA CLASSIFICATION SPECIFICATIONS
[SCA classification data + JSON mapping](https://docs.google.com/a/smith.edu/spreadsheets/d/1giEEPnwh4I0jbYOMtxf6jTeK0xAqQINtdPz8B8Qentc/edit?usp=sharing)


### EAD SPECIFICATIONS
Specifications for remediating and processing Smith SC EAD may be found here: [sc_ead-specifications](https://docs.google.com/a/smith.edu/spreadsheets/d/13QDuQZnGBNV0gqr6gzy6yRNtlZCfN9usJNgY6FVxHIM/edit?usp=sharing). To see information about manual updates, etc., check the spreadsheet. Specific decisions by element are below:



#### DECISIONS BY ELEMENT

| Element       | Decision      |
| ------------- |--------------|
| archdesc @level | For most files, @level="collection". Exception: files that start with mnsss292 -- @level="recordgrp". Files that start with mnsss148s -- @level="series". |
| profiledesc/langusage | Replace existing content with "Finding aid written in English." |
| lb | Enter a space where line break tag previously existed. |
| archdesc/did/unitid | HOLD -- request information from collection stewards. 
| archdesc/did/unittitle | For files with mnsss in filename, replace titles in this field with titles in this document: http://bit.ly/2pAj5dF. Match on EADID. For files with manosca and manoscmr in filename, replace "Records" with "records", "Papers" with "papers", and "Collection" with "collection". |
| archdesc/extent | First extent in EAD: numeric character is entered in number field. If first extent's measurement in EAD = boxes, enter boxes in ASpace type. If first extent's measurement in EAD = linear feet / linear ft., enter "Linear Feet" in ASpace type. Second extent in EAD is mapped to container summary. |
| archdesc/langmaterial | Language subelement is entered, where missing in langmaterial element. |
| archdesc/bioghist/head | Remove head subelement. |
| archdesc/scopecontent/head | Remove head subelement. |
| archdesc/arrangement/head | Remove head subelement. |
| arcdesc/descgrp  | Remove descgrp element and retain content inside (accessrestrict, userestrict, processinfo, prefercite, altformavail, acqinfo, accruals, custodhist) |
| bioghist/dao | Remove completely. Generate report of dao links, content, and the EAD ID from which they were pulled. |
| unittitle | Remove trailing commas. |
| unitdate @ type | If there is more than one date or a range of dates in unitdate (e.g. "1897-1902" or "1965, 1967, 1989"), the value in @type should be "inclusive", rather than "single". |
| unitdate | Where "c.", "c", "ca", or "ca.", change to "circa". |
| unitdate | Where "n.d." or "nd", change to "undated". |
| unitdate | When dates are in parentheses, remove parentheses and retain date information. |
| unitdate | When dates are in brackets, remove brackets and retain date information. |
| unitdate | Normalize dates in begin and end date fields so that they follow ISO 8601 formatting, e.g. YYYY-MM-DD.|
| unitdate | Remove duplicate unitdates, created when moving unitdate out of unittitle. |
| did/note | Change to odd element. |
| dsc @type="analyticcover"/c01 | Match c01s in analyticover dsc and in-depth dsc by unittitle. Copy over unittitle, extent, unitdate, arrangement, scopecontent from c01s in analyticover dsc to in-depth c01s. Where multiple unittitle, use unittitle from in-depth dsc. Where multiple, matching (as in equal) extent and unitdate, use extent and unitdate in analyticover dsc. Where multiple, non-matching extent and unitdate, keep both for repeatable extent or date. The unitdates we are likely to come across in both the analyticover and in-depth dsc will either be a range or a range + n.d./single date in a single unitdate. It will always be an expression and not a normalized date. Equal means that the expression is identical. |
| dsc/c/unittitle | Introduce sentence case formatting for series-level components (c01). |
| dsc/c @level | For c02-cN (i.e. all but c01), change @level value from "unspecified" to "file". |
| dsc/c/did/container | For c02-cN (i.e. all but c01), change @label value from "unspecified" to "mixed materials". |
| c/did/note | Change note subelement to odd and move out of did element. Remove @href or @target and leave content of the note. |
| ref @target | Remove all ref subelements but leave content. Ref subelements will be found in dsc/c/odd and archdesc/arrangement. |
| archdesc/index | Pull out content from index and save as text file. Retain EADID for later integration. |
| archdesc/odd | Pull out appendix content from odd and save as text file. Retain EADID for later integration. |


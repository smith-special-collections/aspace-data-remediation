#!/usr/bin/env ruby
require 'nokogiri'
require 'securerandom'
# Formerly duped, currently "with potential to be overlong"
duped_unitids = %w|manosca6
                   manosca59
                   manosca58
                   manosca57
                   manosca56
                   manosca54
                   manosca53
                   manosca52
                   manosca51
                   manosca50
                   manosca5
                   manosca49
                   manosca48
                   manosca47
                   manosca46
                   manosca45
                   manosca44
                   manosca43
                   manosca42
                   manosca41
                   manosca406
                   manosca405
                   manosca404
                   manosca403
                   manosca402
                   manosca401
                   manosca400
                   manosca40
                   manosca4
                   manosca399
                   manosca398
                   manosca396
                   manosca395
                   manosca394
                   manosca393
                   manosca392
                   manosca391
                   manosca390
                   manosca39
                   manosca389
                   manosca388
                   manosca387
                   manosca386
                   manosca385
                   manosca384
                   manosca383
                   manosca382
                   manosca381
                   manosca380
                   manosca38
                   manosca379
                   manosca378
                   manosca377
                   manosca376
                   manosca375
                   manosca374
                   manosca373
                   manosca372
                   manosca371
                   manosca370
                   manosca37
                   manosca369
                   manosca368
                   manosca367
                   manosca361
                   manosca360
                   manosca36
                   manosca359
                   manosca382
                   manosca357
                   manosca356
                   manosca355
                   manosca354
                   manosca352
                   manosca351
                   manosca350
                   manosca35
                   manosca349
                   manosca348
                   manosca347
                   manosca346
                   manosca345
                   manosca344
                   manosca343
                   manosca342
                   manosca341
                   manosca340
                   manosca34
                   manosca339
                   manosca338
                   manosca337
                   manosca336
                   manosca334
                   manosca333
                   manosca332
                   manosca331
                   manosca330
                   manosca33
                   manosca329
                   manosca328
                   manosca327
                   manosca326
                   manosca325
                   manosca324
                   manosca323
                   manosca322
                   manosca321
                   manosca320
                   manosca32
                   manosca319
                   manosca318
                   manosca317
                   manosca316
                   manosca315
                   manosca314
                   manosca311
                   manosca310
                   manosca31
                   manosca309
                   manosca308
                   manosca307
                   manosca306
                   manosca305
                   manosca304
                   manosca303
                   manosca302
                   manosca300
                   manosca30
                   manosca3
                   manosca299
                   manosca298
                   manosca297
                   manosca296
                   manosca295
                   manosca294
                   manosca293
                   manosca292
                   manosca291
                   manosca290
                   manosca29
                   manosca289
                   manosca288
                   manosca287
                   manosca286
                   manosca285
                   manosca284
                   manosca283
                   manosca282
                   manosca281
                   manosca280
                   manosca28
                   manosca279
                   manosca278
                   manosca277
                   manosca276
                   manosca275
                   manosca274
                   manosca273
                   manosca272
                   manosca271
                   manosca270
                   manosca27
                   manosca269
                   manosca268
                   manosca267
                   manosca266
                   manosca265
                   manosca264
                   manosca263
                   manosca262
                   manosca261
                   manosca260
                   manosca26
                   manosca259
                   manosca258
                   manosca257
                   manosca256
                   manosca255
                   manosca254
                   manosca253
                   manosca252
                   manosca251
                   manosca250
                   manosca25
                   manosca249
                   manosca248
                   manosca247
                   manosca246
                   manosca245
                   manosca244
                   manosca243
                   manosca242
                   manosca241
                   manosca240
                   manosca24
                   manosca239
                   manosca238
                   manosca237
                   manosca236
                   manosca235
                   manosca234
                   manosca233
                   manosca232
                   manosca231
                   manosca230
                   manosca23
                   manosca229
                   manosca228
                   manosca227
                   manosca226
                   manosca225
                   manosca224
                   manosca223
                   manosca222
                   manosca221
                   manosca220
                   manosca22
                   manosca219
                   manosca218
                   manosca217
                   manosca216
                   manosca215
                   manosca214
                   manosca213
                   manosca212
                   manosca211
                   manosca210
                   manosca21
                   manosca209
                   manosca208
                   manosca207
                   manosca206
                   manosca205
                   manosca204
                   manosca203
                   manosca202
                   manosca201
                   manosca200
                   manosca199
                   manosca198
                   manosca197
                   manosca196
                   manosca195
                   manosca194
                   manosca193
                   manosca192
                   manosca191
                   manosca190
                   manosca189
                   manosca188
                   manosca187
                   manosca186
                   manosca185
                   manosca184
                   manosca183
                   manosca182
                   manosca181
                   manosca180
                   manosca179
                   manosca178
                   manosca177
                   manosca176
                   manosca175
                   manosca174
                   manosca173
                   manosca172
                   manosca171
                   manosca167
                   manosca166
                   manosca164
                   manosca163
                   manosca162
                   manosca161
                   manosca160
                   manosca16
                   manosca159
                   manosca158
                   manosca157
                   manosca156
                   manosca155
                   manosca154
                   manosca153
                   manosca152
                   manosca151
                   manosca150
                   manosca15
                   manosca149
                   manosca148
                   manosca147
                   manosca145
                   manosca144
                   manosca143
                   manosca142
                   manosca141
                   manosca140
                   manosca14
                   manosca139
                   manosca138
                   manosca136
                   manosca135
                   manosca134
                   manosca133
                   manosca132
                   manosca131
                   manosca130
                   manosca13
                   manosca129
                   manosca128
                   manosca127
                   manosca126
                   manosca125
                   manosca124
                   manosca123
                   manosca122
                   manosca121
                   manosca12
                   manosca119
                   manosca118
                   manosca117
                   manosca116
                   manosca115
                   manosca114
                   manosca113
                   manosca112
                   manosca111
                   manosca110
                   manosca11
                   manosca109
                   manosca108
                   manosca107
                   manosca106
                   manosca103
                   manosca102
                   manosca101
                   manosca100
                   manosca10
                   manosca1
                   mnsss585
                   mnsss581
                   mnsss49
                   mnsss489
                   mnsss482
                   mnsss480
                   mnsss458
                   mnsss441
                   mnsss33
                   mnsss32
                   mnsss311
                   mnsss292rgart
                   mnsss292rgOM
                   mnsss292rg9
                   mnsss292rg8
                   mnsss292rg7
                   mnsss292rg6s7
                   mnsss292rg6s6
                   mnsss292rg6s5
                   mnsss292rg6s4
                   mnsss292rg6s3
                   mnsss292rg6s2
                   mnsss292rg6s1
                   mnsss292rg6
                   mnsss292rg5
                   mnsss292rg4
                   mnsss292rg3
                   mnsss292rg2
                   mnsss292rg10
                   mnsss292rg1
                   mnsss292mf
                   mnsss288
                   mnsss279
                   mnsss243
                   mnsss212
                   mnsss211
                   mnsss207
                   mnsss199
                   mnsss193
                   mnsss158
                   mnsss155
                   mnsss15
                   mnsss148s9
                   mnsss148s8
                   mnsss148s7
                   mnsss148s6
                   mnsss148s5pt2
                   mnsss148s5pt1
                   mnsss148s4
                   mnsss148s3
                   mnsss148s2pt2
                   mnsss148s2pt1
                   mnsss148s1
                   mnsss148
                   mnsss141
                   mnsss135
                   mnsss129
                   mnsss128
                   manoscmr9
                   manoscmr8
                   manoscmr7
                   manoscmr6
                   manoscmr5
                   manoscmr28
                   manoscmr27
                   manoscmr26
                   manoscmr25
                   manoscmr23
                   manoscmr22
                   manoscmr21
                   manoscmr19
                   manoscmr17
                   manoscmr15
                   manoscmr13
                   manoscmr12
                   manoscmr11
                   manoscmr10
                   manoscmr1
                   manosca99
                   manosca98
                   manosca97
                   manosca96
                   manosca95
                   manosca94
                   manosca93
                   manosca92
                   manosca91
                   manosca90
                   manosca9
                   manosca88
                   manosca87
                   manosca86
                   manosca84
                   manosca83
                   manosca82
                   manosca81
                   manosca80
                   manosca8
                   manosca79
                   manosca78
                   manosca77
                   manosca76
                   manosca75
                   manosca74
                   manosca73
                   manosca72
                   manosca71
                   manosca7
                   manosca68
                   manosca67
                   manosca66
                   manosca65
                   manosca64
                   manosca63
                   manosca62
                   manosca61
                   manosca60|
duped_unitids.each do |eadid|
  xml = Nokogiri.XML(IO.read("eads/#{eadid}.xml"), nil, 'utf-8')
  unitid = xml.at_xpath('/ead/archdesc/did/unitid')
  if unitid && unitid.content.length > 50
    unitid.content = unitid.content[0..49]
    File.open("out/#{eadid}.xml", 'w') do |f|
      f.write xml.to_s
    end
  end

end

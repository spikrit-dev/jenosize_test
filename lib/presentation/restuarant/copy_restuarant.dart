// import 'package:flutter/material.dart';
// import 'package:jenosize/utils/color.dart';

// class SearchPropertiesWidget extends StatefulWidget {
//   const SearchPropertiesWidget({
//     Key? key,
//     this.searchTerm,
//   }) : super(key: key);

//   final String? searchTerm;

//   @override
//   _SearchPropertiesWidgetState createState() => _SearchPropertiesWidgetState();
// }

// class _SearchPropertiesWidgetState extends State<SearchPropertiesWidget> {
//   // late SearchPropertiesModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     // _model = createModel(context, () => SearchPropertiesModel());

//     // _model.textController ??= TextEditingController(text: widget.searchTerm);
//   }

//   @override
//   void dispose() {
//     // _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // context.watch<FFAppState>();

//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: ColorConstants.appColors,
//       appBar: AppBar(
//         backgroundColor: ColorConstants.gray900,
//         automaticallyImplyLeading: false,
//         leading: const Icon(
//           Icons.arrow_back_rounded,
//           color: Color(0xFF95A1AC),
//           size: 24,
//         ),
//         title: const Text(
//           'Search',
//           style: TextStyle(
//             fontFamily: 'Lexend Deca',
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         actions: const [],
//         centerTitle: false,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Color(0x39000000),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 3,
//                       color: Color(0x39000000),
//                       offset: Offset(0, 1),
//                     )
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 4, 0),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     alignment: const AlignmentDirectional(0, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 4, 0, 4, 0),
//                             child: TextFormField(
//                               // controller: _model.textController,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 labelText: 'Address, city, state...',
//                                 // labelStyle: FlutterFlowTheme.of(context)
//                                 //     .bodyText1
//                                 //     .override(
//                                 //       fontFamily: 'Urbanist',
//                                 //       color: ColorConstants.gray100,
//                                 //     ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 2,
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 2,
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 2,
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 2,
//                                   ),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 prefixIcon: Icon(Icons.search_sharp,
//                                     color: ColorConstants.gray100),
//                               ),
//                               // style: FlutterFlowTheme.of(context)
//                               //     .bodyText1
//                               //     .override(
//                               //       fontFamily: 'Urbanist',
//                               //       color: FlutterFlowTheme.of(context)
//                               //           .tertiaryColor,
//                               //     ),
//                               // validator: _model.textControllerValidator
//                               //     .asValidator(context),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
//                           child: TextButton(
//                             onPressed: () {
//                               print('Button pressed ...');
//                             },
//                             child: const Text('Search',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 )
//                                 // options: FFButtonOptions(
//                                 //   width: 100,
//                                 //   height: 40,
//                                 //   padding: const EdgeInsetsDirectional.fromSTEB(
//                                 //       0, 0, 0, 0),
//                                 //   iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                                 //       0, 0, 0, 0),
//                                 //   color: FlutterFlowTheme.of(context).primaryColor,
//                                 //   textStyle: FlutterFlowTheme.of(context)
//                                 //       .subtitle2
//                                 //       .override(
//                                 //         fontFamily: 'Urbanist',
//                                 //         color: Colors.white,
//                                 //       ),
//                                 //   elevation: 2,
//                                 //   borderSide: const BorderSide(
//                                 //     color: Colors.transparent,
//                                 //     width: 1,
//                                 //   ),
//                                 //   borderRadius: BorderRadius.circular(50),
//                                 // ),
//                                 ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                 child: StreamBuilder<List<PropertiesRecord>>(
//                   // stream: queryPropertiesRecord(),
//                   builder: (context, snapshot) {
//                     // Customize what your widget looks like when it's loading.
//                     if (!snapshot.hasData) {
//                       return Center(
//                         child: SizedBox(
//                           width: 50,
//                           height: 50,
//                           child: CircularProgressIndicator(
//                             color: FlutterFlowTheme.of(context).primaryColor,
//                           ),
//                         ),
//                       );
//                     }
//                     List<PropertiesRecord> listViewPropertiesRecordList =
//                         snapshot.data!;
//                     return ListView.builder(
//                       padding: EdgeInsets.zero,
//                       primary: false,
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       itemCount: listViewPropertiesRecordList.length,
//                       itemBuilder: (context, listViewIndex) {
//                         final listViewPropertiesRecord =
//                             listViewPropertiesRecordList[listViewIndex];
//                         return Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               16, 0, 16, 12),
//                           child: Container(
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 4,
//                                   color: Color(0x32000000),
//                                   offset: Offset(0, 2),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: InkWell(
//                               onTap: () async {
//                                 await Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => PropertyDetailsWidget(
//                                       propertyRef: listViewPropertiesRecord,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Hero(
//                                     tag: valueOrDefault<String>(
//                                       listViewPropertiesRecord.mainImage,
//                                       'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/jyeiyll24v90/pixasquare-4ojhpgKpS68-unsplash.jpg' +
//                                           '$listViewIndex',
//                                     ),
//                                     transitionOnUserGestures: true,
//                                     child: ClipRRect(
//                                       borderRadius: const BorderRadius.only(
//                                         bottomLeft: Radius.circular(0),
//                                         bottomRight: Radius.circular(0),
//                                         topLeft: Radius.circular(8),
//                                         topRight: Radius.circular(8),
//                                       ),
//                                       child: CachedNetworkImage(
//                                         imageUrl: valueOrDefault<String>(
//                                           listViewPropertiesRecord.mainImage,
//                                           'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/jyeiyll24v90/pixasquare-4ojhpgKpS68-unsplash.jpg',
//                                         ),
//                                         width: double.infinity,
//                                         height: 190,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 8, 0, 0),
//                                     child: Text(
//                                       listViewPropertiesRecord.propertyName!
//                                           .maybeHandleOverflow(
//                                         maxChars: 36,
//                                         replacement: '…',
//                                       ),
//                                       // style: FlutterFlowTheme.of(context)
//                                       //     .title3
//                                       //     .override(
//                                       //       fontFamily: 'Urbanist',
//                                       //       color: FlutterFlowTheme.of(context)
//                                       //           .darkText,
//                                       //       fontWeight: FontWeight.bold,
//                                       //     ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsetsDirectional.fromSTEB(
//                                             16, 4, 0, 0),
//                                     child: Text(
//                                       listViewPropertiesRecord
//                                           .propertyNeighborhood!
//                                           .maybeHandleOverflow(
//                                         maxChars: 90,
//                                         replacement: '…',
//                                       ),
//                                       // style: FlutterFlowTheme.of(context)
//                                       //     .bodyText2
//                                       //     .override(
//                                       //       fontFamily: 'Lexend Deca',
//                                       //       color: FlutterFlowTheme.of(context)
//                                       //           .grayIcon,
//                                       //     ),
//                                     ),
//                                   ),
//                                   StreamBuilder<List<ReviewsRecord>>(
//                                     stream: queryReviewsRecord(
//                                       queryBuilder: (reviewsRecord) =>
//                                           reviewsRecord.where('propertyRef',
//                                               isEqualTo:
//                                                   listViewPropertiesRecord
//                                                       .reference),
//                                     ),
//                                     builder: (context, snapshot) {
//                                       // Customize what your widget looks like when it's loading.
//                                       if (!snapshot.hasData) {
//                                         return Center(
//                                           child: SizedBox(
//                                             width: 50,
//                                             height: 50,
//                                             child: CircularProgressIndicator(
//                                               color:
//                                                   FlutterFlowTheme.of(context)
//                                                       .primaryColor,
//                                             ),
//                                           ),
//                                         );
//                                       }
//                                       List<ReviewsRecord>
//                                           containerReviewsRecordList =
//                                           snapshot.data!;
//                                       return Container(
//                                         height: 40,
//                                         decoration: const BoxDecoration(),
//                                         child: Padding(
//                                           padding: const EdgeInsetsDirectional
//                                               .fromSTEB(16, 0, 24, 12),
//                                           child: StreamBuilder<
//                                               List<ReviewsRecord>>(
//                                             stream: queryReviewsRecord(
//                                               queryBuilder: (reviewsRecord) =>
//                                                   reviewsRecord.where(
//                                                       'propertyRef',
//                                                       isEqualTo:
//                                                           listViewPropertiesRecord
//                                                               .reference),
//                                               singleRecord: true,
//                                             ),
//                                             builder: (context, snapshot) {
//                                               // Customize what your widget looks like when it's loading.
//                                               if (!snapshot.hasData) {
//                                                 return const Center(
//                                                   child: SizedBox(
//                                                     width: 50,
//                                                     height: 50,
//                                                     child: CircularProgressIndicator(
//                                                         // color:
//                                                         //     FlutterFlowTheme.of(
//                                                         //             context)
//                                                         //         .primaryColor,
//                                                         ),
//                                                   ),
//                                                 );
//                                               }
//                                               List<ReviewsRecord>
//                                                   ratingBarReviewsRecordList =
//                                                   snapshot.data!;
//                                               final ratingBarReviewsRecord =
//                                                   ratingBarReviewsRecordList
//                                                           .isNotEmpty
//                                                       ? ratingBarReviewsRecordList
//                                                           .first
//                                                       : null;
//                                               return Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 children: const [
//                                                   Icon(
//                                                     Icons.star_rounded,
//                                                     color: Color(0xFFFFA130),
//                                                     size: 24,
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         EdgeInsetsDirectional
//                                                             .fromSTEB(
//                                                                 4, 0, 0, 0),
//                                                     child: Text('หลงทาง'
//                                                         // functions.ratingSummaryList(
//                                                         //     containerReviewsRecordList
//                                                         //         .toList()),
//                                                         // style:
//                                                         //     FlutterFlowTheme.of(
//                                                         //             context)
//                                                         //         .bodyText2
//                                                         //         .override(
//                                                         //           fontFamily:
//                                                         //               'Lexend Deca',
//                                                         //           color: const Color(
//                                                         //               0xFF8B97A2),
//                                                         //           fontSize: 12,
//                                                         //           fontWeight:
//                                                         //               FontWeight
//                                                         //                   .normal,
//                                                         //         ),
//                                                         ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         EdgeInsetsDirectional
//                                                             .fromSTEB(
//                                                                 2, 0, 0, 0),
//                                                     child: Text(
//                                                       'Rating',
//                                                       // style:
//                                                       //     FlutterFlowTheme.of(
//                                                       //             context)
//                                                       //         .bodyText2
//                                                       //         .override(
//                                                       //           fontFamily:
//                                                       //               'Lexend Deca',
//                                                       //           color: const Color(
//                                                       //               0xFF8B97A2),
//                                                       //           fontSize: 12,
//                                                       //           fontWeight:
//                                                       //               FontWeight
//                                                       //                   .normal,
//                                                       //         ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

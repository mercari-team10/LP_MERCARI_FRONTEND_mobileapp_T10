// import 'dart:developer';
// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:drift/native.dart';
// import 'package:injectable/injectable.dart';
// import 'package:drift/native.dart';
// import 'package:path/path.dart' as p;
// import 'package:drift/drift.dart';
// import 'package:path_provider/path_provider.dart';

// part 'database_class.g.dart';

// @DataClassName('PostDomain')
// class Posts extends Table {
//   TextColumn get id => text()();
//   TextColumn get council => text()();
//   TextColumn get sub => text()();
//   TextColumn get type => text()();
//   TextColumn get owner => text()();
//   TextColumn get tags => text()();
//   TextColumn get title => text()();
//   TextColumn get message => text()();
//   TextColumn get body => text()();
//   TextColumn get url => text()();
//   TextColumn get author => text()();
//   IntColumn get timeStamp => integer().named('timeStamp').withDefault(
//       currentDateAndTime.secondsSinceEpoch * const Constant(1000))();
//   IntColumn get startTime => integer().named('startTime').nullable()();
//   IntColumn get endTime => integer().named('endTime').nullable()();
//   BoolColumn get bookmark => boolean().withDefault(const Constant(false))();
//   BoolColumn get reminder => boolean().withDefault(const Constant(false))();
//   BoolColumn get isFetched =>
//       boolean().named('isFetched').withDefault(const Constant(false))();
//   BoolColumn get isFeatured =>
//       boolean().named('isFeatured').withDefault(const Constant(false))();

//   @override
//   Set<Column> get primaryKey => {id};
// }

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(
//       file,
//       // logStatements: true,
//     );
//   });
// }

// @injectable
// @DriftDatabase(tables: [Posts], daos: [PostDao])
// // queries: {
// //     // An implementation of this query will be generated inside the _$TaskDaoMixin
// //     // Both completeTasksGenerated() and watchCompletedTasksGenerated() will be created.
// //     "toggleBookmark" : "UPDATE posts SET bookmark = ? WHERE id = ? ",
// //     "toggleReminder": "UPDATE posts SET reminder = ? WHERE id = ? ",
// //   },)
// class PostDatabase extends _$PostDatabase {
//   PostDatabase() : super(_openConnection());
//   @override
//   int get schemaVersion => 1;
// }

// // @Singleton(as: PostDBInterface)
// @DriftAccessor(tables: [Posts],

// 	queries: {
//     // An implementation of this query will be generated inside the _$TaskDaoMixin
//     // Both completeTasksGenerated() and watchCompletedTasksGenerated() will be created.
//     "toggleBookmark" : "UPDATE posts SET bookmark = ? WHERE id = ?",
//     "toggleReminder": "UPDATE posts SET reminder = ? WHERE id = ?",
//   },
// )
// class PostDao extends DatabaseAccessor<PostDatabase>
//     with _$PostDaoMixin
//     implements PostDBInterface {
//   PostDatabase db;
//   PostDao(this.db) : super(db);
//   static Notfs schema = Notfs();
//   @override
//   Future<List<Post>> getAllPosts() => (select(posts)
//         ..where((postTable) => postTable.type.contains(schema.typeCreate)))
//       .map((postDomain) => postDomain.toPost)
//       .get();

// 	@override
//   Stream<Post> getPost({required String postId}){
// 		return (select(posts)
// 				..where((postTable) => postTable.id.equals(postId)))
// 				.map((postDomain) => postDomain.toPost)
// 				.watchSingle();
// 	}

// 	@override
// 	Future<Either<DBFailure,List<Post>>> getAllBookmarkedPosts() async {
// 		try{
// 			final res = await (select(posts)
//         ..where((postTable) => postTable.type.contains(schema.typeCreate, ) & postTable.bookmark ))
//       .map((postDomain) => postDomain.toPost)
//       .get();
// 			return right(res);
// 		}catch(e){
// 			return left(const DBFailure.unknownError());
// 		}
// 	}

//   @override
//   Stream<List<Post>> watchPostsWithPrefs(List<String> prefs ,int limit) => (select(posts)
//         ..where((post) =>
//             post.sub.isIn(prefs) & post.type.contains(schema.typeCreate)
// 						& post.isFeatured.equals(false))
//         ..orderBy([
//           (p) => OrderingTerm(expression: p.timeStamp, mode: OrderingMode.desc)
//         ])
// 				..limit(limit)
// 			)
//       .map((postDomain) => postDomain.toPost)
//       .watch();

//   @override
//   Stream<List<Post>> watchAllPosts() {
//     return (select(posts)
//           ..where((postTable) => postTable.type.contains(schema.typeCreate)	& postTable.isFeatured.equals(false))
//           ..orderBy([
//             (p) =>
//                 OrderingTerm(expression: p.timeStamp, mode: OrderingMode.desc)
//           ]))
//         .map((postDomain) => postDomain.toPost)
//         .watch();
//   }

//   @override
//   Stream<List<Post>> watchAllFeaturedPosts() {
//     return (select(posts)
//           ..where((postTable) =>
//               postTable.isFeatured & postTable.type.contains(schema.typeCreate))
//           ..orderBy([
//             (p) =>
//                 OrderingTerm(expression: p.timeStamp, mode: OrderingMode.desc)
//           ]))
//         .map((postDomain) => postDomain.toPost)
//         .watch();
//   }

//   @override
//   Stream<List<Post>> watchAllOngoingEvents() {
//     return (select(posts)
//           ..where((postTable) =>
//               postTable.reminder &
//               postTable.type.contains(schema.typeCreate) &
//               postTable.startTime.isSmallerOrEqualValue(
//                   DateTime.now().millisecondsSinceEpoch) &
//               postTable.endTime
//                   .isBiggerOrEqualValue(DateTime.now().millisecondsSinceEpoch))
//           ..orderBy([
//             (p) =>
//                 OrderingTerm(expression: p.endTime)
//           ]))
//         .map((postDomain) => postDomain.toPost)
//         .watch();
//   }

//   @override
//   Stream<List<Post>> watchAllUpcomingEvents() {
//     return (select(posts)
//           ..where((postTable) =>
//               postTable.reminder &
//               postTable.type.contains(schema.typeCreate) &
//               postTable.startTime
//                   .isBiggerThanValue(DateTime.now().millisecondsSinceEpoch) &
//               postTable.endTime
//                   .isBiggerThanValue(DateTime.now().millisecondsSinceEpoch))
//           ..orderBy([
//             (p) =>
//                 OrderingTerm(expression: p.startTime)
//           ]))
//         .map((postDomain) => postDomain.toPost)
//         .watch();
//   }

//   @override
//   Stream<List<Post>> watchAllReminders(DateTime date) {
// 		// log(date.toIso8601String(), name:'WATCHREMINDERS');
//     return (select(posts)
//           ..where((postTable) =>
//               postTable.type.contains(schema.typeCreate) & postTable.reminder
// 							& postTable.startTime.isBiggerOrEqualValue(date.sliceTime.millisecondsSinceEpoch)
// 							& postTable.startTime.isSmallerThanValue(date.sliceTime.add(const Duration(days: 1)).millisecondsSinceEpoch)
// 							// isBetweenValues(
// 							// 		date.sliceTime.millisecondsSinceEpoch, 
// 							// 		(date.sliceTime.add(const Duration(hours: 11, minutes: 59)).microsecondsSinceEpoch)
// 							// 	)
// 							) 
//           ..orderBy([
//             (p) =>
//                 OrderingTerm(expression: p.startTime)
//           ]))
//         .map((postDomain){
// 					// log((date.sliceTime.add(const Duration(hours: 11, minutes: 59))).toIso8601String(), name:'WATCH REMINDERS');
// 					return postDomain.toPost;
// 				} )
//         .watch();
//   }

//   @override
//   Future<int> deletePost(Post post) async{
//     try{
// 			(delete(posts)..where((p){
// 				log(post.id.toString(), name:'DELETEPOST');
// 				return p.id.equals(post.id);
// 			})).go();
// 			return 0;
// 		}catch(e){
// 			rethrow;
// 			// return 1;
// 		}
//   }

//   @override
//   Future<Either<DBFailure,Unit>> insertPost(Post post) async {
// 		try {
// 			const PostsCompanion postsCompanion = PostsCompanion();
// 			await into(posts).insert(post.toDomainPost,
// 					mode: InsertMode.insertOrReplace,
// 					onConflict: DoUpdate((old) => postsCompanion.fromPost(
// 							post: post, bookmark: old.bookmark, reminder: old.reminder)));
// 			return right(unit);
// 		} catch (e) {
// 			return left(const DBFailure.unknownError());
// 		}
//   }

//   @override
//   Future<Either<DBFailure,bool>> updatePost(Post post) async {
// 		try {
// 			final res = await update(posts).replace(post.toDomainPost);
// 			return right(res);
// 		} catch (e) {
// 			return left(const DBFailure.unknownError());
// 		}
//   }

//   @override
//   Future<Either<DBFailure,Unit>> insertMultiplePost({required List data,required String owner}) async {
//     try{
// 			// final List<PostDomain> insertableList = [];
// 			final _notfs = Notfs();
// 			const PostsCompanion postsCompanion = PostsCompanion();
// 			for(final post in data){
// 				final Post _post = Post.fromMap(post as Map<String, dynamic>);
// 				if (_post.type == _notfs.typePermisssion) {
// 					if (owner == _post.owner) {
// 						// insertableList.add(_post.toDomainPost);
// 						await into(posts).insert(_post.toDomainPost,
// 							mode: InsertMode.insertOrReplace,
// 							onConflict: DoUpdate((old) => postsCompanion.fromPost(
// 									post: _post, bookmark: old.bookmark, reminder: old.reminder)));
// 					}
// 					// TODO: add council condition also
// 				} else if (_post.type == _notfs.typeDraft && owner == _post.owner) {
// 					// insertableList.add(_post.toDomainPost);
// 					await into(posts).insert(_post.toDomainPost,
// 							mode: InsertMode.insertOrReplace,
// 							onConflict: DoUpdate((old) => postsCompanion.fromPost(
// 									post: _post, bookmark: old.bookmark, reminder: old.reminder)));
// 				} else {
// 					// insertableList.add(_post.toDomainPost);
// 					await into(posts).insert(_post.toDomainPost,
// 							mode: InsertMode.insertOrReplace,
// 							onConflict: DoUpdate((old) => postsCompanion.fromPost(
// 									post: _post, bookmark: old.bookmark, reminder: old.reminder)));
// 				}
// 			}
// 			// ignore: avoid_function_literals_in_foreach_calls
// 			// data.forEach((post) {
// 			// 	final Post _post = Post.fromMap(post as Map<String, dynamic>);
// 			// 	if (_post.type == _notfs.typePermisssion) {
// 			// 		if (owner == _post.owner) {
// 			// 			insertableList.add(_post.toDomainPost);
// 			// 				await into(posts).insert(post.toDomainPost,
// 			// 				mode: InsertMode.insertOrReplace,
// 			// 				onConflict: DoUpdate((old) => postsCompanion.fromPost(
// 			// 						post: post, bookmark: old.bookmark, reminder: old.reminder)));
// 			// 		}
// 			// 		// TODO: add council condition also
// 			// 	} else if (_post.type == _notfs.typeDraft && owner == _post.owner) {
// 			// 		insertableList.add(_post.toDomainPost);
// 			// 	} else {
// 			// 		insertableList.add(_post.toDomainPost);
// 			// 	}
// 			// });
// 			// print(insertableList);

// 			// await into(posts)
// 			// batch((b) {
// 			// 	for (final postDomain in insertableList) {
// 			// 		b.insert<$PostsTable, PostDomain>(posts, postDomain,
// 			// 				mode: InsertMode.insertOrReplace,
// 			// 				onConflict: DoUpdate((old) => postsCompanion.fromPost(
// 			// 						post: postDomain.toPost,
// 			// 						bookmark: old.bookmark,
// 			// 						reminder: old.reminder)));
// 			// 	}
// 			// 	return b;
// 			// });
			
// 			return right(unit);
// 		}catch(e) {
// 			return left(const DBFailure.unknownError());
// 		}
//   }

//   @override
//   Stream<List<Post>> watchAllPendingApproval(
//       {required String council,required bool isLevel2,required String owner}) {
//     return (select(posts)
//           ..where((postTable) => isLevel2
//               ? (postTable.type.equals(schema.typePermisssion) &
//                   postTable.council.equals(council))
//               : (postTable.type
//                       .isIn([schema.typeCreate, schema.typePermisssion]) &
//                   postTable.owner.equals(owner)))
//           ..orderBy([
//             (p) =>
//                 OrderingTerm(expression: p.timeStamp, mode: OrderingMode.desc)
//           ]))
//         .map((postDomain) => postDomain.toPost)
//         .watch();
//   }

//   @override
//   Stream<List<Post>> watchUpdateDraftSection(
//       {required String council,
//       required bool isUpdate,
//       required String owner}) {
//     return (select(posts)
//           ..where((postTable) =>
// 							postTable.type.isIn(
// 										isUpdate ? 
// 										[schema.typeCreate, schema.typePermisssion] : [schema.typeDraft]
// 									) &
//               (postTable.owner.equals(owner) &
//               postTable.council.equals(council)))
//           ..orderBy([
//             (p) =>
//                 OrderingTerm(expression: p.timeStamp, mode: OrderingMode.desc)
//           ]))
//         .map((postDomain) => postDomain.toPost)
//         .watch();
//   }

// 	@override
//   Future<Map<DateTime, List<Post>>> getAllPostBetweenDate(
//       DateTime date, DateTime endDate) async {
//     final startDate = date.onlyDate.millisecondsSinceEpoch;
//     final _endDate =
//         DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59)
//             .millisecondsSinceEpoch;
//     final Map<DateTime, List<Post>> v = {};
//     final _posts = await (select(posts)
//           ..where((postTable) =>
// 							postTable.type.equals(schema.typeCreate) &
//               postTable.reminder.equals(true) &
//               postTable.startTime.isBetweenValues(startDate, _endDate))
//           ..orderBy([(p) => OrderingTerm(expression: p.startTime)]))
//         .map((postDomain) => MapEntry(
//             postDomain.startTime!.toDateTime.onlyDate, postDomain.toPost))
//         .get();
//     // ignore: avoid_function_literals_in_foreach_calls
//     _posts.forEach((entry) {
//       v.update(
//           entry.key,
//           (value) => value.isNotEmpty == true
//               ? (value..add(entry.value))
//               : [entry.value],
//           ifAbsent: () => [entry.value]);
//     });
//     return v;
//   }

// 	@override 
// 	Future<void> deleteAllPosts() async{
// 		try {
// 			delete(posts).go();
// 		} catch (e) {
// 			return;
// 		}
// 	}

//   @override
//   Future<Either<DBFailure, int>> toggleBookmarkReminder(Post post, bool isBookmark) async{
//     try {
// 			final res = isBookmark ? await toggleBookmark(post.bookmark, post.id)
// 				: await toggleReminder(post.reminder, post.id);
// 			return right(res);
// 		} catch (e) {
// 			return left(const DBFailure.unknownError());
// 		}
//   }
// }

// extension IntX on int {
//   DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
// }

// extension DateTimeX on DateTime {
//   DateTime get onlyDate => DateTime(year, month, day);
// }

// extension PostsCompanionX on PostsCompanion {
//   Insertable<PostDomain> fromPost(
//           {required Post post,
//           required GeneratedColumn<bool?> bookmark,
//           required GeneratedColumn<bool?> reminder}) =>
//       PostsCompanion.custom(
//           id: Variable<String>(post.id),
//           council: Variable<String>(post.council),
//           sub: Variable<String>(post.sub.first.toString()),
//           type: Variable<String>(post.type),
//           owner: Variable<String>(post.owner),
//           tags: Variable<String>(post.tags),
//           title: Variable<String>(post.title),
//           message: Variable<String>(post.message),
//           body: Variable<String>(post.body),
//           url: Variable<String>(post.url),
//           author: Variable<String>(post.author),
//           bookmark: bookmark.equalsExp(const Variable<bool>(true)),
//           reminder: reminder.equalsExp(const Variable<bool>(true)),
//           endTime: Variable<int>(post.endTime!),
//           isFeatured: Variable<bool>(post.isFeatured),
//           isFetched: Variable<bool>(post.isFetched),
//           startTime: Variable<int>(post.startTime!),
//           timeStamp: Variable<int>(post.timeStamp)
// 			);
// }

// extension PostDomainX on PostDomain {
//   Post get toPost {
//     return Post(
//       id: this.id,
//       author: author,
//       council: council,
//       owner: owner,
//       sub: [sub],
//       tags: tags,
//       timeStamp: timeStamp,
//       title: title,
//       message: message,
//       body: body,
//       url: url,
//       type: type,
//       startTime: startTime,
//       endTime: endTime,
//       isFeatured: isFeatured,
//       isFetched: isFetched,
//       bookmark: bookmark,
//       reminder: reminder,
//       dateAsString: convertDateToString(timeStamp),
//     );
//   }

//   PostTile get toPostTile => PostTile(
//         post: toPost,
//       );
// }

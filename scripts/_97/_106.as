package _97
{
   import _1529._1528;
   import _1529._1530;
   import egret.managers.Translator;
   
   public class _106
   {
      public static const LEARN_DB:Array = ["http://dragonbones.com/cn/learn.html","http://dragonbones.com/en/learn.html"];
      
      public static const USER_GUIDE:Array = ["http://developer.egret.com/cn/github/egret-docs/DB/dbPro/interface/mainInterface/index.html","http://edn.egret.com/en/index.php/article/index/id/528"];
      
      public static const VIDEO_TUTORIALS:Array = ["http://developer.egret.com/cn/list/video/id/91","http://istvanszep.thinkific.com/courses/animate-your-game-characters-for-free-with-inkscape-and-dragonbones?coupon=startdragonbones"];
      
      public static const API_REFERENCE:String = "http://developer.egret.com/cn/apidoc/index/name/dragonBones.Armature";
      
      public static const NEW_FEATURE:Array = ["http://bbs.egret.com/thread-29602-1-1.html","http://blog.dragonbones.com/blog/category/whats-new/"];
      
      public static const OFFICIAL_DEMO:String = "http://developer.egret.com/cn/example/page/index#160-db-basic";
      
      public static const DATA_FORMAT:String = "http://edn.egret.com/cn/docs/page/887";
      
      public static const EGRET_WEBSITE:String = "http://www.egret.com/";
      
      public static const DB_WEBPAGE:Array = ["http://www.egret.com/products/dragonbones.html","http://dragonbones.github.io/"];
      
      public static const DEV_NETWORK:String = "http://developer.egret.com/";
      
      public static const DB_CODE:String = "https://github.com/DragonBones/";
      
      public static const VIDEO_CENTER:Array = ["https://space.bilibili.com/7302056/#/channel/detail?cid=28375","https://www.youtube.com/user/DragonBonesTeam/playlists"];
      
      public static const FORUM:Array = ["http://bbs.egret.com/forum-101-1.html","http://forum.starling-framework.org/forum/dragon-bones"];
      
      public static const EDN_AGREEMENT:String = "http://edn.egret.com/cn/page/index/id/293";
      
      public static const SHARE_ACITVITY:String = "http://bbs.egret.com/forum.php?mod=viewthread&tid=7402&fromuid=10908";
      
      public static const OPEN_TRELLO:String = "https://trello.com/b/oooKrTH8/dragonbones-idea-collection";
      
      public static const QUESTIONNAIRE:String = "http://store.egret.com/wenda/dragonbones/";
      
      public static const GOTO_STORE:String = "http://t.egret.com/work/2-0.html";
      
      public static const LEARN_PAID:Array = ["http://www.dragonbones.github.io/cn/paid-membership.html","http://www.dragonbones.github.io/en/paid-membership.html"];
      
      public static const PAID_AGREEMENT:Array = ["http://www.dragonbones.github.io/cn/files/dragonbones_paid_member_agreement.txt","http://www.dragonbones.github.io/en/files/dragonbones_paid_member_agreement.txt"];
      
      private static var _2288:String = "http://bbs.egret.com/thread-20410-1-1.html";
      
      private static var _10672:String = "http://bbs.egret.com/thread-23800-1-1.html";
      
      private static var _11288:String = "http://bbs.egret.com/thread-25224-1-1.html";
      
      private static var _12435:String = "http://bbs.egret.com/forum.php?mod=viewthread&tid=26460";
      
      private static var _12944:String = "http://bbs.egret.com/thread-28539-1-1.html";
      
      private static var _13236:String = "http://bbs.egret.com/thread-29602-1-1.html";
      
      private static var _13235:String = "http://blog.dragonbones.com/blog/category/whats-new/";
      
      private static var _2301:Object = {};
      
      public function _106()
      {
         super();
      }
      
      public static function local(param1:Array) : String
      {
         return param1[_1528.language == _1530.zh_CN ? 0 : 1];
      }
      
      public static function _2291(param1:String) : String
      {
         if(!param1)
         {
            return null;
         }
         var _loc2_:RegExp = /\d+.\d+.\d{1,3}/;
         var _loc3_:Array = param1.match(_loc2_);
         if(Boolean(_loc3_) && Boolean(_loc3_.length))
         {
            param1 = _loc3_[0];
         }
         _2298();
         if(!_2301 || !_2301[Translator.locale])
         {
            return null;
         }
         return _2301[Translator.locale][param1];
      }
      
      private static function _2298() : void
      {
         _2301["zh_CN"] = {};
         _2301["en_US"] = {};
         _2301["zh_CN"]["4.7.1"] = _2288;
         _2301["zh_CN"]["4.9.0"] = _10672;
         _2301["zh_CN"]["5.0.0"] = _11288;
         _2301["zh_CN"]["5.1.0"] = _12435;
         _2301["zh_CN"]["5.2.0"] = _12944;
         _2301["zh_CN"]["5.3.0"] = _13236;
         _2301["en_US"]["5.2.0"] = _2301["en_US"]["5.3.0"] = _13235;
      }
   }
}


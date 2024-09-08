package _97
{
   import _1315._1319;
   import egret.utils.FileUtil;
   import flash.display.BitmapData;
   import flash.filesystem.File;
   import flash.utils.Dictionary;
   
   public class _117
   {
      public static var _2375:String = "000000";
      
      public static var _11125:Boolean = false;
      
      public static var _10678:Dictionary = new Dictionary();
      
      public static var _11211:Boolean = false;
      
      public function _117()
      {
         super();
      }
      
      public static function _2374() : void
      {
         var _loc1_:File = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = ["comic/index.html","comic/main.min.js","comic/libs/qrcode.js","comic/libs/modules/egret/egret.min.js","comic/libs/modules/egret/egret.web.min.js","comic/libs/modules/game/game.min.js","comic/libs/modules/game/game.web.min.js","comic/libs/modules/res/res.min.js","comic/libs/modules/tween/tween.min.js","comic/resource/arrow.json","comic/resource/arrowtexture.json"];
         _loc4_ = File.applicationStorageDirectory.resolvePath("comic").nativePath;
         FileUtil.deletePath(_loc4_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc1_ = File.applicationDirectory.resolvePath("egretlauncher/" + _loc5_[_loc6_]);
            if(!_loc1_.exists)
            {
               _loc1_ = File.applicationDirectory;
               _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
               _loc1_ = _loc1_.resolvePath("doc").resolvePath("egretlauncher/" + _loc5_[_loc6_]);
            }
            _loc2_ = _loc1_.nativePath;
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc4_ = File.applicationStorageDirectory.resolvePath(_loc5_[_loc6_]).nativePath;
            FileUtil.save(_loc4_,_loc3_);
            _loc6_++;
         }
         var _loc7_:String = "comic/resource/arrowtexture.png";
         _loc1_ = File.applicationDirectory.resolvePath("egretlauncher/" + _loc7_);
         if(!_loc1_.exists)
         {
            _loc1_ = File.applicationDirectory;
            _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
            _loc1_ = _loc1_.resolvePath("doc").resolvePath("egretlauncher/" + _loc7_);
         }
         _loc2_ = _loc1_.nativePath;
         _loc4_ = File.applicationStorageDirectory.resolvePath(_loc7_).nativePath;
         FileUtil.copyTo(_loc2_,_loc4_,true);
      }
      
      public static function _2372() : void
      {
         var _loc1_:File = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = ["release/index.html","release/main.min.js","release/libs/qrcode.js","release/libs/dragonBones/dragonBones.min.js","release/libs/modules/egret/egret.min.js","release/libs/modules/egret/egret.web.min.js","release/libs/modules/game/game.min.js","release/libs/modules/game/game.web.min.js","release/libs/modules/res/res.min.js","release/libs/modules/tween/tween.min.js"];
         _loc4_ = File.applicationStorageDirectory.resolvePath("release").nativePath;
         FileUtil.deletePath(_loc4_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc1_ = File.applicationDirectory.resolvePath("egretlauncher/" + _loc5_[_loc6_]);
            if(!_loc1_.exists)
            {
               _loc1_ = File.applicationDirectory;
               _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
               _loc1_ = _loc1_.resolvePath("doc").resolvePath("egretlauncher/" + _loc5_[_loc6_]);
            }
            _loc2_ = _loc1_.nativePath;
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc4_ = File.applicationStorageDirectory.resolvePath(_loc5_[_loc6_]).nativePath;
            FileUtil.save(_loc4_,_loc3_);
            _loc6_++;
         }
      }
      
      public static function _2373() : void
      {
         var _loc1_:File = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Array = ["Cocos 1.x Importer/cocos.excfg","Cocos 1.x Importer/cocos.js","Cocos 1.x Importer/icon.png","Spine Importer/spine.excfg","Spine Importer/spine.js","Spine Importer/icon.png"];
         _loc3_ = File.applicationStorageDirectory.resolvePath("plugins").nativePath;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc1_ = File.applicationDirectory.resolvePath("plugins/" + _loc4_[_loc5_]);
            if(!_loc1_.exists)
            {
               _loc1_ = File.applicationDirectory;
               _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
               _loc1_ = _loc1_.resolvePath("doc").resolvePath("plugins/" + _loc4_[_loc5_]);
            }
            _loc2_ = _loc1_.nativePath;
            _loc3_ = File.applicationStorageDirectory.resolvePath("plugins/" + _loc4_[_loc5_]).nativePath;
            FileUtil.copyTo(_loc2_,_loc3_,true);
            _loc5_++;
         }
      }
      
      public static function _2377(param1:String) : void
      {
         var _loc2_:String = File.applicationStorageDirectory.resolvePath("crash_log.txt").nativePath;
         var _loc3_:String = FileUtil.openAsString(_loc2_);
         _loc3_ += param1;
         FileUtil.save(_loc2_,_loc3_);
      }
      
      public static function _10284() : void
      {
         var _loc1_:File = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = ["asn1/lib/ber/errors.js","asn1/lib/ber/index.js","asn1/lib/ber/reader.js","asn1/lib/ber/types.js","asn1/lib/ber/writer.js","asn1/lib/index.js","asn1/tst/ber/reader.test.js","asn1/tst/ber/writer.test.js","asn1/package.json","node-rsa/src/NodeRSA.js","node-rsa/src/utils.js","node-rsa/src/encryptEngines/encryptEngines.js","node-rsa/src/encryptEngines/io.js","node-rsa/src/encryptEngines/js.js","node-rsa/src/encryptEngines/node12.js","node-rsa/src/formats/components.js","node-rsa/src/formats/formats.js","node-rsa/src/formats/pkcs1.js","node-rsa/src/formats/pkcs8.js","node-rsa/src/libs/jsbn.js","node-rsa/src/libs/rsa.js","node-rsa/src/schemes/oaep.js","node-rsa/src/schemes/pkcs1.js","node-rsa/src/schemes/pss.js","node-rsa/src/schemes/schemes.js"];
         _loc4_ = File.applicationStorageDirectory.resolvePath("node_modules").nativePath;
         FileUtil.deletePath(_loc4_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc1_ = File.applicationDirectory.resolvePath("node_modules/" + _loc5_[_loc6_]);
            if(!_loc1_.exists)
            {
               _loc1_ = File.applicationDirectory;
               _loc1_ = new File(FileUtil.getDirectory(File.applicationDirectory.nativePath));
               _loc1_ = _loc1_.resolvePath("doc").resolvePath("node_modules/" + _loc5_[_loc6_]);
            }
            _loc2_ = _loc1_.nativePath;
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc4_ = File.applicationStorageDirectory.resolvePath("node_modules/" + _loc5_[_loc6_]).nativePath;
            FileUtil.save(_loc4_,_loc3_);
            _loc6_++;
         }
      }
      
      public static function _10677(param1:String, param2:BitmapData) : void
      {
         var _loc3_:_1319 = new _1319();
         var _loc4_:String = File.applicationStorageDirectory.resolvePath("recent/" + param1 + ".png").nativePath;
         _10678[param1] = param2;
         FileUtil.save(_loc4_,_loc3_.encode(param2));
      }
   }
}


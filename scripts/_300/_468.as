package _300
{
   import _11106._11108;
   import _11106._12897;
   import _11111._11110;
   import _313.InstallFlashPluginCmd;
   import _6._9;
   import _783.CommandNotification;
   import _93._92;
   import _97._106;
   import egret.utils.FileUtil;
   import egret.utils._1501;
   import flash.filesystem.File;
   import flash.filesystem.FileStream;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class _468 extends _92
   {
      protected var _3462:String;
      
      protected var _3463:String = "";
      
      protected var _3465:String;
      
      public function _468()
      {
         this._3462 = File.applicationStorageDirectory.resolvePath("version.txt").nativePath;
         this._3465 = File.applicationStorageDirectory.resolvePath("flashPlugin").resolvePath("flashPlugin.plg").nativePath;
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3460();
         this._3459();
      }
      
      override public function _1572(param1:*) : void
      {
         super._2223 = param1;
      }
      
      protected function _3460() : void
      {
         if(!this._3455)
         {
            this._3466();
         }
         else
         {
            if(!(Boolean(this._3455) && Boolean(this._3456) && this.compareVersion(this._3458,this._3457)))
            {
               return;
            }
            this._3466();
         }
         FileUtil.save(this._3462,this._3456,true);
      }
      
      protected function _3466() : void
      {
         var _loc1_:RegExp = null;
         var _loc2_:Boolean = false;
         this._3463 = _106._2291(this._3458);
         if(this._3463)
         {
            _loc1_ = /^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+/;
            _loc2_ = Boolean(_loc1_.test(this._3463));
            if(_loc2_)
            {
               navigateToURL(new URLRequest(this._3463),"_blank");
               _11110.instance._12948._13259(_12897.NewFeature,_11108.Launch);
            }
         }
         _2210._1567(new _9(CommandNotification.NEWFEATHER_GUIDE));
      }
      
      protected function _3459() : void
      {
         var _loc2_:Object = null;
         var _loc1_:FileStream = FileUtil.open(this._3465);
         if(_loc1_)
         {
            _loc2_ = _loc1_.readObject();
            if(!_loc2_)
            {
               this._3454();
            }
            else
            {
               if(_loc2_["name"])
               {
                  return;
               }
               this._3454();
            }
         }
         else
         {
            this._3454();
         }
         _loc2_ = {};
         _loc2_["name"] = "flashPlugin";
         FileUtil.save(this._3465,_loc2_,true);
      }
      
      protected function _3454() : void
      {
         var _loc1_:InstallFlashPluginCmd = new InstallFlashPluginCmd();
         _loc1_._1572(null);
         _loc1_.execute();
      }
      
      public function get _3455() : String
      {
         return FileUtil.openAsString(this._3462);
      }
      
      public function get _3456() : String
      {
         return _1501.currentVersion + _1501.currentVersionLabel;
      }
      
      public function get _3457() : String
      {
         var _loc1_:RegExp = /\d+.\d+.\d{1,3}/;
         var _loc2_:* = this._3455.match(_loc1_)[0];
         return _loc2_ as String;
      }
      
      public function get _3458() : String
      {
         return _1501.currentVersion;
      }
      
      public function compareVersion(param1:String, param2:String) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         var _loc9_:String = null;
         var _loc10_:Number = NaN;
         if(Boolean(param1) && Boolean(param2))
         {
            _loc3_ = this._3464(param1);
            _loc4_ = Number(_loc3_);
            _loc5_ = this._3464(param2);
            _loc6_ = Number(_loc5_);
            if(_loc4_ > _loc6_)
            {
               return true;
            }
            if(_loc4_ == _loc6_)
            {
               _loc7_ = this._3461(param1);
               _loc8_ = Number(_loc7_);
               _loc9_ = this._3461(param2);
               _loc10_ = Number(_loc9_);
               if(_loc8_ > _loc10_)
               {
                  return true;
               }
               return false;
            }
            if(_loc4_ < _loc6_)
            {
               return false;
            }
         }
         return false;
      }
      
      public function _3464(param1:String) : String
      {
         var _loc2_:int = int(param1.indexOf("."));
         if(_loc2_ < 0)
         {
            return "";
         }
         var _loc3_:int = int(param1.indexOf(".",_loc2_ + 1));
         if(_loc3_ < 0)
         {
            return "";
         }
         return param1.substring(0,_loc3_);
      }
      
      public function _3461(param1:String) : String
      {
         var _loc2_:int = int(param1.lastIndexOf("."));
         return param1.substring(_loc2_ + 1,param1.length);
      }
   }
}


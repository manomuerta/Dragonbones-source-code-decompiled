package _521
{
   import _11106._11108;
   import _11111._11110;
   import _12454._12453;
   import _346._10432;
   import _346._352;
   import _346._359;
   import _346._361;
   import egret.utils.FileUtil;
   import flash.desktop.NativeApplication;
   import flash.events.InvokeEvent;
   import flash.filesystem.File;
   import flash.net.URLVariables;
   
   public class _527
   {
      private static var instance:_527;
      
      private var _3262:String = "";
      
      public function _527()
      {
         super();
      }
      
      public static function getInstance() : _527
      {
         if(!instance)
         {
            instance = new _527();
         }
         return instance;
      }
      
      public function _2592() : void
      {
         NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE,this._3803);
      }
      
      private function _3803(param1:InvokeEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:_359 = null;
         var _loc5_:_361 = null;
         var _loc6_:_352 = null;
         var _loc7_:_12453 = null;
         var _loc8_:Array = null;
         var _loc9_:URLVariables = null;
         var _loc10_:_10432 = null;
         if(Boolean(param1.arguments) && param1.arguments.length > 0)
         {
            _loc3_ = param1.arguments[0];
            if(_loc3_.substr(_loc3_.length - 3).toLowerCase() == "zip")
            {
               _loc4_ = new _359();
               _loc4_._1572(_loc3_);
               _loc4_.execute();
            }
            else if(_loc3_.substr(_loc3_.length - 6).toLowerCase() == "dbproj")
            {
               _loc5_ = new _361();
               _loc5_._1572(_loc3_);
               _loc5_.execute();
            }
            else if(_loc3_.toLowerCase() == "import")
            {
               _11110.instance._11131._11130(_11108.Command);
               _loc6_ = new _352();
               _loc6_._1572(param1.arguments);
               _loc6_.execute();
            }
            else if(_loc3_.toLowerCase() == "export")
            {
               _11110.instance._11137._11130(_11108.Command);
               _loc7_ = new _12453();
               _loc7_._1572(param1.arguments);
               _loc7_.execute();
            }
            else if(_loc3_.indexOf("dragonbonespro:///") >= 0)
            {
               _loc3_ = _loc3_.replace("dragonbonespro:///","");
               _loc8_ = _loc3_.split("?");
               switch(_loc8_[0])
               {
                  case "import":
                     if(_loc8_.length > 1)
                     {
                        _loc9_ = new URLVariables(_loc8_[1]);
                        _loc10_ = new _10432();
                        _loc10_._1572(_loc9_);
                        _loc10_.execute();
                     }
               }
            }
         }
      }
      
      public function _2377(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         if(this._2376 != "")
         {
            _loc2_ = new File(this._2376 + "log.txt").nativePath;
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc3_ += param1 + "\r\n";
            FileUtil.save(_loc2_,_loc3_);
         }
      }
      
      public function get _2376() : String
      {
         return this._3262;
      }
      
      public function set _2376(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         this._3262 = param1;
         if(this._3262 != "")
         {
            _loc2_ = new File(this._2376 + "log.txt").nativePath;
            _loc3_ = FileUtil.openAsString(_loc2_);
            _loc3_ += "----------" + new Date().toString() + "----------" + "\r\n";
            FileUtil.save(_loc2_,_loc3_);
         }
      }
   }
}


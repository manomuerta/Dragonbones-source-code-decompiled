package _204
{
   public class _208
   {
      public function _208()
      {
         super();
      }
      
      public static function _2274(param1:XML) : XML
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc2_:Array = [];
         for each(_loc4_ in param1[_205.ARMATURE])
         {
            _loc2_.push(_1736(_loc4_));
         }
         _loc5_ = _loc2_.join("\n");
         return new XML("<dragonBones name=\"" + param1.@name + "\"" + "isGlobal=\"" + param1.@isGlobal + "\"" + "frameRate=" + "\"" + param1.@frameRate + "\"" + "version=" + "\"" + "4.0" + "\"" + ">\n" + "\t" + _loc5_ + "\n" + "</dragonBones>");
      }
      
      private static function _1736(param1:XML) : XML
      {
         var _loc2_:XML = null;
         var _loc8_:XML = null;
         var _loc9_:XML = null;
         var _loc10_:XML = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         var _loc7_:Object = {};
         for each(_loc8_ in param1[_205.BONE])
         {
            _loc3_.push(_loc8_);
         }
         for each(_loc9_ in param1[_205.SKIN])
         {
            _loc4_.push(_loc9_);
            _1773(_loc9_,_loc5_,_loc7_);
         }
         for each(_loc10_ in param1[_205.ANIMATION])
         {
            _loc6_.push(_loc10_);
            _1730(_loc10_,_loc5_);
         }
         _loc11_ = _loc3_.join("\n");
         _loc12_ = _loc5_.join("\n");
         _loc13_ = _loc4_.join("\n");
         _loc14_ = _loc6_.join("\n");
         return new XML("<armature name=\"" + param1.@name + "\">\n" + "\t" + _loc11_ + "\n\t" + _loc12_ + "\n\t" + _loc13_ + "\n\t" + _loc14_ + "\n" + "</armature>");
      }
      
      private static function _1773(param1:XML, param2:Array, param3:Object) : void
      {
         var _loc4_:String = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         for each(_loc6_ in param1[_205.SLOT])
         {
            _loc4_ = _loc6_[_205.A_NAME];
            if(param3[_loc4_] == null)
            {
               _loc5_ = _loc6_.copy();
               param3[_loc4_] = _loc5_;
               param2.push(_loc5_);
            }
         }
      }
      
      private static function _1730(param1:XML, param2:Array) : void
      {
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:Array = [];
         for each(_loc4_ in param1[_205.TIMELINE])
         {
            _loc3_ = _loc3_.concat(_2271(_loc4_,param2));
         }
         if(_loc3_.length > 0)
         {
            _loc5_ = 0;
            _loc6_ = int(_loc3_.length);
            while(_loc5_ < _loc6_)
            {
               param1.prependChild(_loc3_[_loc5_]);
               _loc5_++;
            }
         }
      }
      
      private static function _2271(param1:XML, param2:Array) : Array
      {
         var _loc3_:Boolean = false;
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc11_:XML = null;
         var _loc12_:XML = null;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         for each(_loc6_ in param1[_205.FRAME])
         {
            _loc5_.push(int(_loc6_.@z));
            if(int(_loc6_.@displayIndex) != 0 || Boolean(String(_loc6_.@z != "")))
            {
               _loc3_ = true;
            }
            var _loc18_:int = 0;
            var _loc19_:* = _loc6_[_205.COLOR_TRANSFORM];
            for each(_loc7_ in _loc19_)
            {
               _loc3_ = true;
            }
            if(_loc3_)
            {
               break;
            }
         }
         if(_loc5_.length > 0)
         {
            _loc8_ = int(_loc5_[0]);
            for each(_loc9_ in _loc5_)
            {
               if(_loc8_ != _loc9_)
               {
                  _loc3_ = true;
                  break;
               }
            }
         }
         if(_loc3_)
         {
            _loc10_ = [];
            _loc14_ = 0;
            _loc15_ = int(param2.length);
            while(_loc14_ < _loc15_)
            {
               _loc11_ = param2[_loc14_];
               if(_loc11_.@parent == param1.@name)
               {
                  _loc10_.push(String(_loc11_.@name));
               }
               _loc14_++;
            }
            if(_loc10_.length > 0)
            {
               _loc14_ = 0;
               _loc15_ = int(_loc10_.length);
               while(_loc14_ < _loc15_)
               {
                  _loc13_ = param1.toString();
                  _loc13_ = (_loc13_ = _loc13_.replace("<timeline","<slot")).replace("timeline>","slot>");
                  (_loc12_ = new XML(_loc13_)).@name = _loc10_[_loc14_];
                  _loc4_.push(_loc12_);
                  _loc14_++;
               }
            }
         }
         return _loc4_;
      }
      
      public static function _2272(param1:Object) : Object
      {
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:Object = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1[_205.ARMATURE])
         {
            for each(_loc4_ in _loc3_[_205.BONE])
            {
               _loc4_.inheritScale = false;
            }
            _loc5_ = {};
            _loc6_ = [];
            for each(_loc7_ in _loc3_[_205.SKIN])
            {
               for each(_loc9_ in _loc7_[_205.SLOT])
               {
                  if(_loc5_[_loc9_.name] == null)
                  {
                     _loc5_[_loc9_.name] = _loc9_;
                  }
               }
            }
            for each(_loc9_ in _loc5_)
            {
               _loc6_.push(_loc9_);
            }
            _loc3_[_205.SLOT] = _loc6_;
            for each(_loc8_ in _loc3_[_205.ANIMATION])
            {
               _loc10_ = [];
               _loc11_ = [];
               for each(_loc12_ in _loc8_[_205.TIMELINE])
               {
                  _loc11_.push(_loc12_);
                  _loc10_ = _loc10_.concat(_2270(_loc12_,_loc6_));
               }
               _loc8_[_205.SLOT] = _loc10_;
               _loc8_[_205.BONE] = _loc11_;
               delete _loc8_[_205.TIMELINE];
            }
         }
         param1.version = "4.0";
         return param1;
      }
      
      private static function _2270(param1:Object, param2:Array) : Object
      {
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         for each(_loc5_ in param2)
         {
            if(_loc5_.parent == param1.name)
            {
               _loc3_.push(_loc5_.name);
            }
         }
         for each(_loc6_ in _loc3_)
         {
            (_loc7_ = {}).name = _loc6_;
            _loc7_.offset = param1.offset;
            _loc7_.scale = param1.scale;
            _loc7_.frame = param1.frame;
            for each(_loc8_ in param1.frame)
            {
               _loc9_ = _loc8_.colorTransform;
               _loc8_.color = _loc9_;
               delete _loc8_.colorTransform;
            }
            _loc4_.push(_loc7_);
         }
         return _loc4_;
      }
   }
}


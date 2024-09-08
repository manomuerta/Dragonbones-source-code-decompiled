package _477
{
   import _13503._13502;
   import _176._175;
   import _204._210;
   import _51._50;
   import _51._79;
   import _721._720;
   import _73.SymbolType;
   import _97._101;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class _13539 extends _494
   {
      public function _13539()
      {
         super();
      }
      
      override public function run() : void
      {
         if(!_3238.exportData)
         {
            complete();
            return;
         }
         if(_3238.version != _101.DATA_VERSION_4_0 && _3238.version != _101.DATA_VERSION_4_5 && _3238.version != _101.DATA_VERSION_5_0)
         {
            _3238.version = _101.DATA_VERSION_5_0;
         }
         this._3674();
         var _loc1_:Object = _175._2670(_3238.dragonBonesVO,_3238.version,false,true);
         if(_loc1_.name == "")
         {
            _loc1_.name = _3238.projectName;
         }
         if(_3238.scale != 1)
         {
            _175._2660(_loc1_,_3238.scale);
         }
         this._10727(_loc1_);
         _3613._3675 = _loc1_;
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Object = null;
         switch(_3238.dataType)
         {
            case _720.DATA_TYPE_JSON:
               _loc3_ = {
                  "path":_3613.ouputPath + _3238.outputName + "_ske.json",
                  "data":JSON.stringify(_loc1_)
               };
               break;
            case _720.DATA_TYPE_XML:
               _loc3_ = {
                  "path":_3613.ouputPath + _3238.outputName + "_ske.xml",
                  "data":_210(_loc1_)
               };
         }
         this._2222 = _loc3_;
         _3613._3676.push(_loc3_);
         complete();
      }
      
      private function _10727(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Array = param1.armature;
         var _loc3_:Array = _loc2_.concat();
         if(_3238.targetType != _720.TARGET_ALL)
         {
            _loc4_ = 0;
            _loc5_ = int(_loc2_.length);
            while(_loc4_ < _loc5_)
            {
               if(_3238._10711.indexOf(_loc2_[_loc4_].name) == -1)
               {
                  _loc2_.splice(_loc4_,1);
                  _loc4_--;
                  _loc5_--;
               }
               _loc4_++;
            }
            if(_loc2_.length == 0)
            {
               param1.armature = _loc3_;
               _3238.targetType = _720.TARGET_ALL;
            }
         }
      }
      
      private function _3674() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(_3238.dragonBonesVO._2126.length);
         while(_loc1_ < _loc2_)
         {
            this._3672(_3238.dragonBonesVO._2126[_loc1_]);
            _loc1_++;
         }
      }
      
      private function _3672(param1:_50) : void
      {
         var _loc3_:_13502 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Rectangle = new Rectangle();
         _loc2_.left = undefined;
         _loc2_.right = undefined;
         _loc2_.top = undefined;
         _loc2_.bottom = undefined;
         var _loc4_:_13502 = param1._1977;
         var _loc5_:int = 0;
         if(param1._1811 == SymbolType.MC || param1._1811 == SymbolType.STAGE)
         {
            if(param1._1963.length > 0)
            {
               _loc3_ = param1._13619[_loc5_] as _13502;
               _loc3_._1874();
               _loc3_._1858(0);
               param1._1751();
               this._3671(param1,_loc2_);
            }
         }
         else
         {
            if(_loc4_)
            {
               _loc4_._1868();
               param1._1751();
            }
            this._3671(param1,_loc2_);
         }
         if(isNaN(_loc2_.left))
         {
            _loc2_.left = 0;
         }
         if(isNaN(_loc2_.right))
         {
            _loc2_.right = 0;
         }
         if(isNaN(_loc2_.top))
         {
            _loc2_.top = 0;
         }
         if(isNaN(_loc2_.bottom))
         {
            _loc2_.bottom = 0;
         }
         param1.aabb = _loc2_;
         if(_loc4_ == null)
         {
            if(_loc3_)
            {
               _loc3_._1868();
            }
         }
         else
         {
            _loc4_._1874();
         }
         param1._1751();
      }
      
      private function _3671(param1:_50, param2:Rectangle) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_79 = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         _loc3_ = 0;
         _loc4_ = int(param1._1780.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1._1780[_loc3_];
            if(_loc5_._2049)
            {
               _loc6_ = _loc5_.globalTransform.x - _loc5_._2038 / 2;
               _loc7_ = _loc5_.globalTransform.x + _loc5_._2038 / 2;
               _loc8_ = _loc5_.globalTransform.y - _loc5_._2037 / 2;
               _loc9_ = _loc5_.globalTransform.y + _loc5_._2037 / 2;
               if(isNaN(param2.left) || _loc6_ < param2.left)
               {
                  param2.left = _loc6_;
               }
               if(isNaN(param2.right) || _loc7_ > param2.right)
               {
                  param2.right = _loc7_;
               }
               if(isNaN(param2.top) || _loc8_ < param2.top)
               {
                  param2.top = _loc8_;
               }
               if(isNaN(param2.bottom) || _loc9_ > param2.bottom)
               {
                  param2.bottom = _loc9_;
               }
            }
            _loc3_++;
         }
      }
   }
}


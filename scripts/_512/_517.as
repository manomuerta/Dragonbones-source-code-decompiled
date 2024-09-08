package _512
{
   import _176._175;
   import _178._186;
   import _178._187;
   import _178._190;
   import _178._192;
   import _178._193;
   import _178._201;
   import _204._205;
   import _204._208;
   import _204._209;
   import _97._101;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _517 extends _513
   {
      public function _517()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc2_:_187 = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:XML = null;
         var _loc6_:Object = null;
         var _loc1_:Object = _3287._1717;
         if(_loc1_ is XML)
         {
            _loc4_ = _loc1_[_205.A_VERSION];
            switch(_loc4_)
            {
               case _101.DATA_VERSION_2_3:
               case _101.DATA_VERSION_3_0:
                  _loc5_ = _208._2274(XML(_loc1_));
                  _loc2_ = _201._2659(_loc5_);
                  break;
               case _101.DATA_VERSION_4_0:
               case _101.DATA_VERSION_4_5:
               case _101.DATA_VERSION_5_0:
                  _loc5_ = XML(_loc1_);
                  _loc3_ = _201._2717(_loc5_);
            }
         }
         else if(_loc1_ is Object)
         {
            _loc4_ = _loc1_.version;
            switch(_loc4_)
            {
               case _101.DATA_VERSION_2_3:
               case _101.DATA_VERSION_3_0:
                  _loc6_ = _208._2272(_loc1_);
                  _loc2_ = _190._2659(_loc6_);
                  break;
               case _101.DATA_VERSION_4_0:
               case _101.DATA_VERSION_4_5:
               case _101.DATA_VERSION_5_0:
               case _101.DATA_VERSION_5_5:
                  _loc3_ = _loc1_;
            }
         }
         _3287._3737 = _loc4_;
         if(_loc4_ == _101.DATA_VERSION_2_3 || _loc4_ == _101.DATA_VERSION_3_0)
         {
            this._3738(_loc2_);
            _loc2_._2655();
            _loc3_ = _175._2663(_loc2_,true);
         }
         _3287._1717 = _loc3_;
         complete();
      }
      
      private function _3738(param1:_187) : void
      {
         var _loc2_:Vector.<_192> = null;
         var _loc3_:Vector.<_193> = null;
         var _loc4_:_193 = null;
         var _loc5_:_186 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Object = null;
         var _loc15_:Matrix = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Point = null;
         var _loc6_:int = 0;
         var _loc7_:int = int(param1._2126.length);
         while(_loc6_ < _loc7_)
         {
            _loc2_ = param1._2126[_loc6_]._1781;
            _loc8_ = 0;
            _loc9_ = int(_loc2_.length);
            while(_loc8_ < _loc9_)
            {
               _loc3_ = _loc2_[_loc8_]._1780;
               _loc10_ = 0;
               _loc11_ = int(_loc3_.length);
               while(_loc10_ < _loc11_)
               {
                  _loc4_ = _loc3_[_loc10_] as _193;
                  _loc12_ = 0;
                  _loc13_ = int(_loc4_._1752.length);
                  while(_loc12_ < _loc13_)
                  {
                     _loc5_ = _loc4_._1752[_loc12_];
                     _loc14_ = _3287._3712[_loc5_.name];
                     if(_loc14_)
                     {
                        if(param1.isRelativePivot)
                        {
                           _loc15_ = new Matrix();
                           _209._2013(_loc5_.transform,_loc15_);
                           _loc16_ = (_loc5_.pivot.x - 0.5) * _loc14_.width;
                           _loc17_ = (_loc5_.pivot.y - 0.5) * _loc14_.height;
                           _loc18_ = new Point(_loc16_,_loc17_);
                           _loc18_ = _loc15_.transformPoint(_loc18_);
                           _loc5_.pivot.x = _loc18_.x - _loc5_.transform.x;
                           _loc5_.pivot.y = _loc18_.y - _loc5_.transform.y;
                           if(isNaN(_loc5_.pivot.x))
                           {
                              _loc5_.pivot.x = 0;
                           }
                           if(isNaN(_loc5_.pivot.y))
                           {
                              _loc5_.pivot.y = 0;
                           }
                        }
                        else
                        {
                           _loc5_.pivot.x -= _loc14_.width / 2;
                           _loc5_.pivot.y -= _loc14_.height / 2;
                        }
                     }
                     _loc12_++;
                  }
                  _loc10_++;
               }
               _loc8_++;
            }
            _loc6_++;
         }
      }
   }
}


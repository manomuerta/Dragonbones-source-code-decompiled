package _204
{
   import _178._179;
   import _178._180;
   import _178._181;
   import _178._184;
   import _178._189;
   import _178._192;
   import _178._193;
   import _178._194;
   import _178._195;
   import _178._199;
   import _178._200;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public final class _206
   {
      public function _206()
      {
         super();
      }
      
      public static function _2765(param1:_180) : void
      {
         var _loc4_:_181 = null;
         var _loc5_:_181 = null;
         var _loc2_:Vector.<_181> = param1._1779;
         var _loc3_:int = int(_loc2_.length);
         while(_loc3_--)
         {
            _loc4_ = _loc2_[_loc3_];
            if(_loc4_.parent)
            {
               _loc5_ = param1._2749(_loc4_.parent);
               if(_loc5_)
               {
                  _loc4_.transform.copy(_loc4_.global);
                  _loc4_.transform._2195(_loc5_.global);
               }
            }
         }
      }
      
      public static function _2800(param1:_180) : void
      {
         var _loc2_:Vector.<_179> = param1._1963;
         var _loc3_:int = int(_loc2_.length);
         while(_loc3_--)
         {
            _2764(_loc2_[_loc3_],param1,false);
         }
      }
      
      public static function _2801(param1:_179, param2:_180) : void
      {
      }
      
      public static function _2764(param1:_179, param2:_180, param3:Boolean) : void
      {
         var _loc6_:Vector.<_193> = null;
         var _loc8_:_181 = null;
         var _loc9_:_200 = null;
         var _loc10_:_195 = null;
         var _loc11_:_193 = null;
         var _loc12_:Vector.<_189> = null;
         var _loc13_:_184 = null;
         var _loc14_:Point = null;
         var _loc15_:_199 = null;
         var _loc16_:uint = 0;
         var _loc17_:int = 0;
         var _loc18_:Vector.<_189> = null;
         var _loc19_:_199 = null;
         var _loc20_:Number = NaN;
         var _loc21_:_194 = null;
         if(!param3)
         {
            _2801(param1,param2);
            return;
         }
         var _loc4_:_192 = param2._2747(null);
         var _loc5_:Vector.<_181> = param2._1779;
         if(_loc4_)
         {
            _loc6_ = param2._1780;
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc8_ = _loc5_[_loc7_];
            _loc9_ = param1._2741(_loc8_.name);
            _loc10_ = param1._1875(_loc8_.name);
            if(!(!_loc9_ && !_loc10_))
            {
               _loc11_ = null;
               if(_loc6_)
               {
                  for each(_loc11_ in _loc6_)
                  {
                     if(_loc11_.parent == _loc8_.name)
                     {
                        break;
                     }
                  }
               }
               _loc12_ = _loc9_._1816;
               if(_loc10_)
               {
                  _loc18_ = _loc10_._1816;
               }
               _loc13_ = null;
               _loc14_ = null;
               _loc15_ = null;
               _loc16_ = _loc12_.length;
               _loc17_ = 0;
               while(_loc17_ < _loc16_)
               {
                  _loc19_ = _loc12_[_loc17_] as _199;
                  _2803(param1,param2,_loc8_,_loc19_);
                  _loc19_.transform.x -= _loc8_.transform.x;
                  _loc19_.transform.y -= _loc8_.transform.y;
                  _loc19_.transform.skewX -= _loc8_.transform.skewX;
                  _loc19_.transform.skewY -= _loc8_.transform.skewY;
                  _loc19_.transform.scaleX /= _loc8_.transform.scaleX;
                  _loc19_.transform.scaleY /= _loc8_.transform.scaleY;
                  if(!_loc13_)
                  {
                     _loc13_ = _loc9_._1904;
                     _loc13_.copy(_loc19_.transform);
                     _loc13_.skewX = _209._2804(_loc13_.skewX);
                     _loc13_.skewY = _209._2804(_loc13_.skewY);
                     (_loc14_ = _loc9_._1797).x = _loc19_.pivot.x;
                     _loc14_.y = _loc19_.pivot.y;
                  }
                  _loc19_.transform.x -= _loc13_.x;
                  _loc19_.transform.y -= _loc13_.y;
                  _loc19_.transform.skewX = _209._2804(_loc19_.transform.skewX - _loc13_.skewX);
                  _loc19_.transform.skewY = _209._2804(_loc19_.transform.skewY - _loc13_.skewY);
                  _loc19_.transform.scaleX /= _loc13_.scaleX;
                  _loc19_.transform.scaleY /= _loc13_.scaleY;
                  if(!_loc9_._2773)
                  {
                     _loc19_.pivot.x -= _loc14_.x;
                     _loc19_.pivot.y -= _loc14_.y;
                  }
                  if(_loc15_)
                  {
                     _loc20_ = _loc19_.transform.skewX - _loc15_.transform.skewX;
                     if(_loc15_.tweenRotate)
                     {
                        if(_loc15_.tweenRotate > 0)
                        {
                           if(_loc20_ < 0)
                           {
                              _loc19_.transform.skewX += Math.PI * 2;
                              _loc19_.transform.skewY += Math.PI * 2;
                           }
                           if(_loc15_.tweenRotate > 1)
                           {
                              _loc19_.transform.skewX += Math.PI * 2 * (_loc15_.tweenRotate - 1);
                              _loc19_.transform.skewY += Math.PI * 2 * (_loc15_.tweenRotate - 1);
                           }
                        }
                        else
                        {
                           if(_loc20_ > 0)
                           {
                              _loc19_.transform.skewX -= Math.PI * 2;
                              _loc19_.transform.skewY -= Math.PI * 2;
                           }
                           if(_loc15_.tweenRotate < 1)
                           {
                              _loc19_.transform.skewX += Math.PI * 2 * (_loc15_.tweenRotate + 1);
                              _loc19_.transform.skewY += Math.PI * 2 * (_loc15_.tweenRotate + 1);
                           }
                        }
                     }
                     else
                     {
                        _loc19_.transform.skewX = _loc15_.transform.skewX + _209._2804(_loc19_.transform.skewX - _loc15_.transform.skewX);
                        _loc19_.transform.skewY = _loc15_.transform.skewY + _209._2804(_loc19_.transform.skewY - _loc15_.transform.skewY);
                     }
                  }
                  _loc15_ = _loc19_;
                  _loc17_++;
               }
               if(Boolean(_loc10_) && Boolean(_loc18_))
               {
                  _loc16_ = _loc18_.length;
                  _loc17_ = 0;
                  while(_loc17_ < _loc16_)
                  {
                     _loc21_ = _loc18_[_loc17_] as _194;
                     if(!_loc10_._2773)
                     {
                        if(_loc11_)
                        {
                           _loc21_.zOrder -= _loc11_.zOrder;
                        }
                     }
                     _loc17_++;
                  }
                  _loc10_._2773 = true;
               }
               _loc9_._2773 = true;
            }
            _loc7_++;
         }
      }
      
      private static function _2803(param1:_179, param2:_180, param3:_181, param4:_199) : void
      {
         var _loc6_:_200 = null;
         var _loc7_:Vector.<_200> = null;
         var _loc8_:Vector.<_181> = null;
         var _loc9_:int = 0;
         var _loc10_:_184 = null;
         var _loc11_:Matrix = null;
         var _loc12_:_184 = null;
         var _loc13_:Matrix = null;
         param4.transform.copy(param4.global);
         var _loc5_:_181 = param2._2749(param3.parent);
         if(_loc5_)
         {
            _loc6_ = param1._2741(_loc5_.name);
            if(_loc6_)
            {
               _loc7_ = new Vector.<_200>();
               _loc8_ = new Vector.<_181>();
               while(_loc6_)
               {
                  _loc7_.push(_loc6_);
                  _loc8_.push(_loc5_);
                  _loc5_ = param2._2749(_loc5_.parent);
                  if(_loc5_)
                  {
                     _loc6_ = param1._2741(_loc5_.name);
                  }
                  else
                  {
                     _loc6_ = null;
                  }
               }
               _loc9_ = int(_loc7_.length);
               _loc11_ = new Matrix();
               _loc12_ = new _184();
               _loc13_ = new Matrix();
               while(_loc9_--)
               {
                  _loc6_ = _loc7_[_loc9_];
                  _loc5_ = _loc8_[_loc9_];
                  _2802(_loc6_,param4.position,_loc12_,!_loc10_);
                  if(!_loc10_)
                  {
                     _loc10_ = new _184();
                     _loc10_.copy(_loc12_);
                  }
                  else
                  {
                     _loc12_.x += _loc6_._1904.x + _loc5_.transform.x;
                     _loc12_.y += _loc6_._1904.y + _loc5_.transform.y;
                     _loc12_.skewX += _loc6_._1904.skewX + _loc5_.transform.skewX;
                     _loc12_.skewY += _loc6_._1904.skewY + _loc5_.transform.skewY;
                     _loc12_.scaleX *= _loc6_._1904.scaleX * _loc5_.transform.scaleX;
                     _loc12_.scaleY *= _loc6_._1904.scaleY * _loc5_.transform.scaleY;
                     _209._2013(_loc12_,_loc13_);
                     _loc13_.concat(_loc11_);
                     _209._2014(_loc13_,_loc10_,_loc12_.scaleX * _loc10_.scaleX >= 0,_loc12_.scaleY * _loc10_.scaleY >= 0);
                  }
                  _209._2013(_loc10_,_loc11_);
               }
               param4.transform._2195(_loc10_);
            }
         }
      }
      
      private static function _2802(param1:_200, param2:int, param3:_184, param4:Boolean) : void
      {
         var _loc7_:_199 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:_199 = null;
         var _loc11_:_184 = null;
         var _loc12_:_184 = null;
         var _loc5_:Vector.<_189> = param1._1816;
         var _loc6_:int = int(_loc5_.length);
         while(_loc6_--)
         {
            _loc7_ = _loc5_[_loc6_] as _199;
            if(_loc7_.position <= param2 && _loc7_.position + _loc7_.duration > param2)
            {
               if(_loc6_ == _loc5_.length - 1 || param2 == _loc7_.position)
               {
                  param3.copy(param4 ? _loc7_.global : _loc7_.transform);
               }
               else
               {
                  _loc8_ = _loc7_.tweenEasing;
                  _loc9_ = (param2 - _loc7_.position) / _loc7_.duration;
                  if(Boolean(_loc8_) && _loc8_ != 10)
                  {
                     _loc9_ = _207._2772(_loc9_,_loc8_);
                  }
                  _loc10_ = _loc5_[_loc6_ + 1] as _199;
                  _loc11_ = param4 ? _loc7_.global : _loc7_.transform;
                  _loc12_ = param4 ? _loc10_.global : _loc10_.transform;
                  param3.x = _loc11_.x + (_loc12_.x - _loc11_.x) * _loc9_;
                  param3.y = _loc11_.y + (_loc12_.y - _loc11_.y) * _loc9_;
                  param3.skewX = _209._2804(_loc11_.skewX + (_loc12_.skewX - _loc11_.skewX) * _loc9_);
                  param3.skewY = _209._2804(_loc11_.skewY + (_loc12_.skewY - _loc11_.skewY) * _loc9_);
                  param3.scaleX = _loc11_.scaleX + (_loc12_.scaleX - _loc11_.scaleX) * _loc9_;
                  param3.scaleY = _loc11_.scaleY + (_loc12_.scaleY - _loc11_.scaleY) * _loc9_;
               }
               break;
            }
         }
      }
      
      public static function _2767(param1:_179, param2:_180) : void
      {
         var _loc5_:_181 = null;
         var _loc6_:String = null;
         var _loc3_:Vector.<_181> = param2._1779;
         var _loc4_:int = int(_loc3_.length);
         while(_loc4_--)
         {
            _loc5_ = _loc3_[_loc4_];
            _loc6_ = _loc5_.name;
            if(!param1._2741(_loc6_))
            {
               if(param1._2738.indexOf(_loc6_) < 0)
               {
                  param1._2738.fixed = false;
                  param1._2738.push(_loc6_);
                  param1._2738.fixed = true;
               }
            }
         }
      }
   }
}


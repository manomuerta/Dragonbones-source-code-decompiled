package _586
{
   import _1038._1039;
   import _51._70;
   import _51._79;
   import _521._530;
   import _708._716;
   import _73._74;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._85;
   import _81._91;
   import _880._879;
   import _948._951;
   import _953._958;
   import _97._103;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _598 extends _592
   {
      private var _5265:Object;
      
      private var _5267:Point;
      
      public var _5266:Boolean;
      
      public function _598()
      {
         this._5265 = {};
         super();
         _5005 = CommandNotification.MODIFY_SLOT_TRANSFORM;
         _5004 = "";
         _5006 = CommandNotification.MODIFY_BASIC_BONE_FRAME_TRANSFORM;
         _5007 = CommandNotification.MODIFY_COMICOBJECT_TRANSFORM;
      }
      
      override protected function _1576() : void
      {
         if(_2216.imageSmooth)
         {
            _879.instance.smoothing = _879.BILINEAR;
         }
         else
         {
            _879.instance.smoothing = _879.NONE;
         }
         super._1576();
         _1565(StageNotification.UPDATE_LIBRARY,this._4307);
         _1565(StageNotification.REDRAW_MESH,this._5270);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.UPDATE_LIBRARY,this._4307);
         _1564(StageNotification.REDRAW_MESH,this._5270);
      }
      
      private function _5270(param1:StageNotification) : void
      {
         var _loc3_:_951 = null;
         var _loc4_:_79 = null;
         var _loc2_:int = 0;
         while(true)
         {
            _loc3_ = this._5273._2490.getElementAt(_loc2_) as _951;
            if(!_loc3_)
            {
               break;
            }
            if(_loc3_.data is _79)
            {
               _loc4_ = _loc3_.data as _79;
               if(_loc4_._2165)
               {
                  _loc4_._2049.mesh.invalid = true;
                  _loc4_._2049.mesh.update();
               }
            }
            _loc2_++;
         }
      }
      
      private function _4307(param1:StageNotification) : void
      {
         var _loc3_:_951 = null;
         var _loc2_:int = 0;
         while(true)
         {
            _loc3_ = this._5273._2490.getElementAt(_loc2_) as _951;
            if(!_loc3_)
            {
               break;
            }
            if(_loc3_.data)
            {
               _103.addItem(_loc3_.data);
            }
            _loc2_++;
         }
         refresh();
         this._5271(_2226._2889);
      }
      
      public function _5126(param1:String, param2:Boolean) : void
      {
         this._5265[param1] = param2;
      }
      
      public function _5068(param1:Point = null) : void
      {
         var _loc2_:_1039 = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:_951 = null;
         var _loc6_:_79 = null;
         var _loc7_:_70 = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Rectangle = null;
         if(_530.instance._3832)
         {
            return;
         }
         if(param1)
         {
            this._5267 = param1;
         }
         else
         {
            param1 = this._5267;
         }
         if(_3176._3332 != _716.CREATE_BONE || Boolean(this._5265["createBone"]))
         {
            _loc2_ = _5017.dataProvider;
            _loc3_ = [];
            _loc4_ = 0;
            while(_loc5_ = this._5273._2490.getElementAt(_loc4_) as _951, _loc5_)
            {
               if(_loc5_._5269)
               {
                  _loc6_ = _loc5_._1824;
                  if(_2226._3367(_loc6_))
                  {
                     _loc7_ = _loc6_._2049;
                     _loc8_ = _loc5_.globalToLocal(param1);
                     if(_loc7_ == null)
                     {
                        return;
                     }
                     _loc9_ = _loc7_.width / 2;
                     _loc10_ = _loc7_.height / 2;
                     if(_loc7_.type == _74.ARMATURE)
                     {
                        _loc12_ = _loc5_.AABB;
                        if(_loc8_.x >= _loc12_.x && _loc8_.x <= _loc12_.x + _loc12_.width && _loc8_.y >= _loc12_.y && _loc8_.y <= _loc12_.y + _loc12_.height)
                        {
                           _loc11_ = _85._2185(_loc8_,_85._2189);
                           if(!_loc3_[0] || _loc11_ < _loc3_[0])
                           {
                              _loc3_[0] = _loc11_;
                              _loc3_[1] = _loc6_;
                           }
                        }
                     }
                     else if(_loc7_.type == _74.MESH)
                     {
                        _loc12_ = (_loc7_ as _70).mesh.AABB;
                        if(_loc12_)
                        {
                           _loc9_ = _loc12_.width;
                           _loc10_ = _loc12_.height;
                           if(_loc8_.x > _loc12_.x && _loc8_.x < _loc12_.x + _loc12_.width && _loc8_.y > _loc12_.y && _loc8_.y < _loc12_.y + _loc12_.height)
                           {
                              if((_loc7_ as _70).mesh.hitTest(_loc8_))
                              {
                                 _loc11_ = _85._2185(_loc8_,_85._2189);
                                 if(!_loc3_[0] || _loc11_ < _loc3_[0])
                                 {
                                    _loc3_[0] = _loc11_;
                                    _loc3_[1] = _loc6_;
                                 }
                              }
                           }
                        }
                     }
                     else if(_loc7_.type == _74.BOUNDINGBOX)
                     {
                        if(_loc7_._11278.hitTest(_loc8_))
                        {
                           _loc11_ = _85._2185(_loc8_,_85._2189);
                           if(!_loc3_[0] || _loc11_ < _loc3_[0])
                           {
                              _loc3_[0] = _loc11_;
                              _loc3_[1] = _loc6_;
                           }
                        }
                     }
                     else if(_loc8_.x > -_loc9_ && _loc8_.x < _loc9_ && _loc8_.y > -_loc10_ && _loc8_.y < _loc10_ && _3176._3332 != _716.WEIGHT)
                     {
                        _loc11_ = _85._2185(_loc8_,_85._2189);
                        if(!_loc3_[0] || _loc11_ < _loc3_[0])
                        {
                           _loc3_[0] = _loc11_;
                           _loc3_[1] = _loc6_;
                        }
                     }
                  }
               }
               _loc4_++;
            }
            this._5268 = _loc3_[1] as _79;
         }
         else
         {
            this._5268 = null;
         }
      }
      
      public function _5271(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_79 = null;
         var _loc2_:Vector.<_79> = new Vector.<_79>();
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(param1[_loc3_] is _79)
            {
               _loc2_.push(param1[_loc3_] as _79);
            }
            else if(param1[_loc3_] is _70)
            {
               _loc5_ = (param1[_loc3_] as _70)._1760;
               if((Boolean(_loc5_)) && _loc5_._2049 == param1[_loc3_])
               {
                  _loc2_.push(_loc5_);
               }
            }
            _loc3_++;
         }
         if(this._5273.dataProvider == null)
         {
            return;
         }
         this._5273._2889 = Vector.<Object>(_loc2_);
         _loc3_ = 0;
         _loc4_ = int(_loc2_.length);
         while(_loc3_ < _loc4_)
         {
            this._5273._2907(_loc2_[_loc3_]);
            _loc3_++;
         }
      }
      
      public function get _5273() : _958
      {
         return _5017 as _958;
      }
      
      override public function get _5012() : _91
      {
         return this._5273._5021;
      }
      
      public function set _5268(param1:_79) : void
      {
         if(this._5273._5021 == param1)
         {
            return;
         }
         if(this._5273._5021)
         {
            this._1567(new StageNotification(StageNotification.ROLLOUT_SLOT,this._5273._5021));
            this._5266 = false;
         }
         this._5273._5021 = param1 as _79;
         if(this._5273._5021)
         {
            this._1567(new StageNotification(StageNotification.ROLLOVER_SLOT,param1));
            this._5266 = true;
         }
      }
   }
}


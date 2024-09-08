package _472
{
   import _13207._13206;
   import _13207._13208;
   import _1404._1407;
   import _24._26;
   import _51._52;
   import _51._70;
   import _51._71;
   import _51._79;
   import _586._594;
   import _658._661;
   import _708._717;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _783.TipNotification;
   import _783._782;
   import _93._94;
   import egret.utils.tr;
   
   public class _13203 extends _94
   {
      private var _4987:Object;
      
      private var _13349:Object;
      
      public var groupModel:_13208;
      
      public function _13203()
      {
         super();
         this._4987 = {};
         this._13349 = {};
         this._4987[_26.STORE_GROUP_0] = 0;
         this._4987[_26.STORE_GROUP_1] = 1;
         this._4987[_26.STORE_GROUP_2] = 2;
         this._4987[_26.STORE_GROUP_3] = 3;
         this._4987[_26.STORE_GROUP_4] = 4;
         this._4987[_26.STORE_GROUP_5] = 5;
         this._4987[_26.STORE_GROUP_6] = 6;
         this._4987[_26.STORE_GROUP_7] = 7;
         this._4987[_26.STORE_GROUP_8] = 8;
         this._4987[_26.STORE_GROUP_9] = 9;
         this._13349[_26.SELECT_GROUP_0] = 0;
         this._13349[_26.SELECT_GROUP_1] = 1;
         this._13349[_26.SELECT_GROUP_2] = 2;
         this._13349[_26.SELECT_GROUP_3] = 3;
         this._13349[_26.SELECT_GROUP_4] = 4;
         this._13349[_26.SELECT_GROUP_5] = 5;
         this._13349[_26.SELECT_GROUP_6] = 6;
         this._13349[_26.SELECT_GROUP_7] = 7;
         this._13349[_26.SELECT_GROUP_8] = 8;
         this._13349[_26.SELECT_GROUP_9] = 9;
         this.groupModel = new _13208();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(_782.CURRENT_DOC_CHANGED,this._13347);
         this._13347(null);
      }
      
      private function _13347(param1:_782) : void
      {
         var _loc2_:Object = null;
         var _loc3_:_71 = null;
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            _loc2_ = _2214._1844._2871._13344;
            _loc3_ = _2214._1844._2871.dragonBonesVO;
            if(_loc3_ && _loc2_ && _loc2_ is Array)
            {
               this.groupModel._13351(_loc3_,_loc2_ as Array);
            }
         }
      }
      
      public function save() : void
      {
         if(_2214 && _2214._1844 && Boolean(_2214._1844._2871))
         {
            _2214._1844._2871._13344 = this.groupModel._5965();
         }
      }
      
      private function _13346(param1:String) : _13206
      {
         var _loc3_:int = 0;
         var _loc2_:int = int(this._13349[param1]);
         if(_loc2_ >= 0 && _loc2_ < _13208.TOTAL_NUM)
         {
            return this.groupModel.groups[_loc2_];
         }
         return null;
      }
      
      public function _13348(param1:String) : void
      {
         var _loc3_:Array = null;
         var _loc2_:_13206 = this._13346(param1);
         if(Boolean(_loc2_) && _loc2_.type != _13206.TYPE_NULL)
         {
            if(_3028 != _loc2_._1886)
            {
               return;
            }
            _loc3_ = _loc2_._13350();
            if(_loc3_.length > 0)
            {
               _1567(new StageNotification(StageNotification.GROUP_SELECT));
               _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc3_));
               if(_loc2_.type == _13206.TYPE_MESH)
               {
                  if(_loc2_._13224.length > 0)
                  {
                     this._4291._12672._2986(_loc2_._13343());
                  }
               }
            }
         }
      }
      
      public function _13345(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:_13206 = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Object = null;
         var _loc2_:int = int(this._4987[param1]);
         if(_loc2_ >= 0 && _loc2_ < _13208.TOTAL_NUM)
         {
            _loc5_ = this.groupModel.groups[_loc2_];
            _loc5_.clear();
            _loc5_._1886 = _3028;
            _loc6_ = int(_2226._2889.length);
            if(_loc6_ > 0)
            {
               if(_loc6_ > 1)
               {
                  _loc5_.type = _13206.TYPE_COMPLEX;
                  _loc3_ = 0;
                  while(_loc3_ < _loc6_)
                  {
                     _loc8_ = _2226._2889[_loc3_];
                     if(_loc8_ is _52)
                     {
                        _loc5_._2922.push(_loc8_ as _52);
                     }
                     else if(_loc8_ is _79)
                     {
                        _loc5_._13352.push(_loc8_ as _79);
                     }
                     else if(_loc8_ is _70)
                     {
                        _loc5_._2978.push(_loc8_ as _70);
                     }
                     _loc3_++;
                  }
                  _loc4_ = _loc6_.toString();
               }
               else
               {
                  _loc8_ = _2226._2889[0];
                  if(_loc8_ is _52)
                  {
                     _loc4_ = _loc8_.name;
                     _loc5_._2922.push(_loc8_ as _52);
                     _loc5_.type = _13206.TYPE_BONE;
                  }
                  else if(_loc8_ is _79)
                  {
                     _loc4_ = _loc8_.name;
                     _loc5_._13352.push(_loc8_ as _79);
                     _loc5_.type = _13206.TYPE_SLOT;
                  }
                  else if(_loc8_ is _70)
                  {
                     _loc4_ = _loc8_.name;
                     _loc5_._2978.push(_loc8_ as _70);
                     _loc5_.type = _13206.TYPE_DISPLAY;
                     if((_loc8_ as _70)._2165)
                     {
                        if(this._4291._4358 != null)
                        {
                           _loc5_.type = _13206.TYPE_MESH;
                           _loc3_ = 0;
                           _loc6_ = int(this._4291._12672._2889.length);
                           while(_loc3_ < _loc6_)
                           {
                              _loc5_._13224.push(this._4291._12672._2889[_loc3_] as _661);
                              _loc3_++;
                           }
                        }
                     }
                  }
               }
            }
            _loc7_ = tr("Tip.Bone.Group.Success",_loc4_,_loc2_);
            _1567(new TipNotification(TipNotification.SHOW_TOOL_TIP,{
               "type":_717.ANIMATE,
               "showText":_loc7_
            }));
            this.save();
         }
      }
      
      public function get _4291() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
   }
}


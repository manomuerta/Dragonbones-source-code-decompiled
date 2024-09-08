package _586
{
   import _1404._1407;
   import _470._469;
   import _51._52;
   import _51._70;
   import _51._77;
   import _51._79;
   import _708._715;
   import _708._717;
   import _724._725;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _953._959;
   import _97._124;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class _606 extends _603
   {
      protected var _5407:Boolean = false;
      
      protected var _2876:_591;
      
      protected var _5406:_597;
      
      public function _606()
      {
         this._2876 = _1407.getInstance(_591) as _591;
         this._5406 = _1407.getInstance(_597) as _597;
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._5406._5262 = _959._5262;
         _3198._5128("selectableFilter",_3286.selectableFilter.bone);
         this._2876.stageView = _5141;
         this._2876.enabled = false;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.ROLLOVER_BONE,this._5404);
         _1565(StageNotification.ROLLOUT_BONE,this._5405);
         _1565(StageNotification.ADD_SEQUENCE_ASSETS_TO_STAGE,this._11155);
         _3198.addEventListener("rolloveredItemChanged",this._5402);
         _5273.addEventListener("rolloveredItemChanged",this._5403);
         if(!stage)
         {
         }
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.ROLLOVER_BONE,this._5404);
         _1564(StageNotification.ROLLOUT_BONE,this._5405);
      }
      
      override protected function _4023(param1:StageNotification) : void
      {
         this._14649();
         _5333._5306();
         _5350._5374(_2226._2889);
         _5141._5373();
         _4222();
      }
      
      override public function _14422() : void
      {
         this._14649();
      }
      
      private function _14649() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_77 = null;
         var _loc6_:Boolean = false;
         var _loc7_:Vector.<_52> = null;
         var _loc8_:Boolean = false;
         if(_2762)
         {
            _loc7_ = new Vector.<_52>();
            _loc1_ = 0;
            _loc2_ = int(_2762._1999.length);
            while(_loc1_ < _loc2_)
            {
               _loc5_ = _2762._1999[_loc1_];
               if(_loc5_.weight < 1)
               {
                  _loc8_ = _2226._3871(_loc5_.target);
                  if(!_loc8_)
                  {
                     _loc3_ = 0;
                     _loc4_ = int(_loc5_.bones.length);
                     while(_loc3_ < _loc4_)
                     {
                        if(_2226._3871(_loc5_.bones[_loc3_]))
                        {
                           _loc8_ = true;
                           break;
                        }
                        _loc3_++;
                     }
                  }
               }
               _loc3_ = 0;
               _loc4_ = int(_loc5_.bones.length);
               while(_loc3_ < _loc4_)
               {
                  if(_loc5_.bones[_loc3_]._14295 != _loc8_)
                  {
                     _loc5_.bones[_loc3_]._14295 = _loc8_;
                     _loc7_.push(_loc5_.bones[_loc3_]);
                     _loc6_ = true;
                  }
                  _loc3_++;
               }
               _loc1_++;
            }
            if(_loc6_)
            {
               _loc1_ = 0;
               _loc2_ = int(_loc7_.length);
               while(_loc1_ < _loc2_)
               {
                  _3198._5370(_loc7_[_loc1_]);
                  _loc1_++;
               }
            }
         }
      }
      
      private function _4014() : void
      {
         var _loc1_:_52 = null;
         var _loc2_:Object = null;
         var _loc3_:_79 = null;
         var _loc4_:Object = null;
         if(_2220._2873 == _715.ARMATURE)
         {
            if(_2226._2889.length == 1)
            {
               if(_2226._2484 is _52)
               {
                  _loc1_ = _2226._2484 as _52;
                  _loc2_ = {"duplicateObj":_loc1_};
                  if(Boolean(_loc1_) && Boolean(_loc1_.parentBoneData))
                  {
                     _1567(new CommandNotification(CommandNotification.DUPLICATE_BONE,_loc2_));
                  }
               }
               else if(_2226._2484 is _79)
               {
                  _loc3_ = _2226._2484 as _79;
                  _loc4_ = {
                     "duplicateObj":_loc3_,
                     "parentBone":_loc3_.parentBoneData,
                     "Dic":new Dictionary()
                  };
                  _1567(new CommandNotification(CommandNotification.DUPLICATE_SLOT,_loc4_));
               }
            }
         }
      }
      
      private function _3852() : void
      {
         if(!_2226._2984)
         {
            if(_2226._2889.length < 1)
            {
               _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.HIGH_LIGHT));
               _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.DEFAULT));
            }
            else
            {
               _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
                  "showText":this._3869(_2226._2889),
                  "type":_717.HIGH_LIGHT
               }));
            }
         }
      }
      
      override protected function _3856(param1:StageNotification) : void
      {
         _3198.mouseEnabled = _3286.selectableFilter.bone;
         _3198.mouseChildren = _3286.selectableFilter.bone;
         super._3856(param1);
         if(Boolean(this._5268) && !_3286.selectableFilter._3866(_2762.id,this._5268.id))
         {
            _5141._5268 = null;
         }
      }
      
      protected function get _5268() : _79
      {
         return _5366._1837;
      }
      
      protected function _5404(param1:StageNotification) : void
      {
         var _loc2_:_52 = param1.data as _52;
         if(_2226._3367(_loc2_))
         {
            _3198._5021 = _loc2_;
            _4222();
         }
      }
      
      protected function _5405(param1:StageNotification) : void
      {
         _3198._5021 = null;
         this._3852();
      }
      
      private function _5402(param1:Event) : void
      {
         if(_3198._5021)
         {
            _5273._5021 = null;
            if(_2226._2889.length == 1 && param1.target._5021 && _2226._2484 == param1.target._5021)
            {
               return;
            }
            _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
               "type":_717.DEFAULT,
               "showText":_3198._5021.name
            }));
         }
      }
      
      private function _5403(param1:Event) : void
      {
         if(_5273._5021)
         {
            _3198._5021 = null;
            _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
               "type":_717.DEFAULT,
               "showText":_5273._5021.name
            }));
         }
         else
         {
            this._3852();
         }
      }
      
      private function _3869(param1:Array) : String
      {
         var _loc2_:String = "";
         if(param1.length)
         {
            if(param1.length == 1)
            {
               if(param1[0].hasOwnProperty("name"))
               {
                  _loc2_ = param1[0].name;
               }
            }
            else
            {
               _loc2_ = tr("Tip.Select.Show",param1.length);
            }
         }
         return _loc2_;
      }
      
      override protected function _5329(param1:StageNotification) : void
      {
         _3198.enabled = false;
         super._5329(param1);
      }
      
      override protected function _5330(param1:StageNotification) : void
      {
         _3198.enabled = true;
         super._5330(param1);
         _2226._2984 = false;
      }
      
      override protected function _5342(param1:Array, param2:Array, param3:Boolean = false) : void
      {
         var _loc5_:Object = null;
         var _loc6_:_70 = null;
         var _loc7_:Point = null;
         var _loc11_:_52 = null;
         var _loc12_:String = null;
         var _loc13_:_79 = null;
         var _loc14_:Point = null;
         var _loc4_:Array = [];
         var _loc8_:Point = _5141._4428.localToGlobal(new Point());
         var _loc9_:int = 0;
         var _loc10_:int = int(param1.length);
         while(_loc9_ < _loc10_)
         {
            _loc6_ = param1[_loc9_];
            _loc7_ = param2[_loc9_];
            _loc11_ = _5141._2762._1990;
            _loc12_ = _124._1747(_loc6_._2120,_loc11_.rootArmatureData._1996);
            _loc13_ = _79._1729(_loc12_,_loc11_);
            _loc14_ = _loc7_;
            if(!param3)
            {
               _loc14_ = new Point((_loc7_.x - _loc8_.x) / _2580,(_loc7_.y - _loc8_.y) / _2580);
            }
            _loc5_ = _469._3482(_loc6_,_5141._2762._1795.name,_loc13_,_loc11_,_loc14_);
            _loc4_.push(_loc5_);
            _loc9_++;
         }
         _1567(new CommandNotification(CommandNotification.ADD_DISPLAYS_TO_BONE,_loc4_));
      }
      
      override public function set _4887(param1:Boolean) : void
      {
         var _loc2_:_52 = null;
         if(this._5407 == param1)
         {
            return;
         }
         this._5407 = param1;
         if(this._5407)
         {
            if(!_2226._3872)
            {
               _1567(new CommandNotification(CommandNotification.ADD_REMOVE_SELECT_ITEM,_5141._2762._1990));
            }
            _loc2_ = _2226._3872;
            _loc2_ = !!_loc2_ ? _loc2_ : _5141._2762._1990;
            _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,[_loc2_]));
            this._2876.enabled = true;
            this._2876._1886 = _2762;
         }
         else if(!this._5407)
         {
            this._2876.enabled = false;
            this._4023(null);
         }
      }
      
      private function _11155(param1:StageNotification) : void
      {
         var _13229:Vector.<_70>;
         var _1836:_52;
         var _1828:String;
         var _1837:_79;
         var _11129:Object;
         var i:int = 0;
         var len:int = 0;
         var e:StageNotification = param1;
         var assets:Vector.<_725> = e.data;
         if(assets == null || assets.length <= 0)
         {
            return;
         }
         assets.sort(function(param1:_725, param2:_725):int
         {
            if(param1.name > param2.name)
            {
               return 1;
            }
            return -1;
         });
         _13229 = new Vector.<_70>();
         i = 0;
         len = int(assets.length);
         while(i < len)
         {
            _13229.push(_70._2090(assets[i]));
            i++;
         }
         _1836 = _5141._2762._1990;
         _1828 = _124._1747(_13229[0]._2120,_1836.rootArmatureData._1996);
         _1837 = _79._1729(_1828,_1836);
         _11129 = {};
         _11129._2978 = _13229;
         _11129._2898 = _5141._2762._1795.name;
         _11129._1837 = _1837;
         _11129._2890 = _1836;
         _1567(new CommandNotification(CommandNotification.ADD_SEQUENCE_ASSETS,_11129));
      }
   }
}


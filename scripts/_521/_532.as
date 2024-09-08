package _521
{
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._79;
   import _6._7;
   import _639._638;
   import _708._715;
   import _708._717;
   import _755._759;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _783.TipNotification;
   import _81._91;
   import egret.utils.tr;
   
   public class _532 extends _7
   {
      public static var instance:_532;
      
      private var _3858:Boolean = false;
      
      private var _3849:Boolean = true;
      
      private var _3848:Boolean = true;
      
      private var _3870:Array;
      
      public var _2984:Boolean = false;
      
      private var _3860:_759;
      
      public function _532()
      {
         this._3870 = [];
         super();
         instance = this;
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_FILTER_STATUS,this._3856);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
      }
      
      private function _4023(param1:StageNotification) : void
      {
         if(!this._2984)
         {
            if(this._2889.length < 1)
            {
               _1567(new TipNotification(TipNotification.HIDE_TOOL_TIP,_717.HIGH_LIGHT));
               _1567(new TipNotification(TipNotification.HIDE_TOOL_TIP,_717.DEFAULT));
            }
            else
            {
               _1567(new TipNotification(TipNotification.SHOW_TOOL_TIP,{
                  "showText":this._3869(this._2889),
                  "type":_717.HIGH_LIGHT
               }));
            }
         }
      }
      
      public function _3314(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = int(this._2889.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._2889.splice(_loc2_,1);
         }
         else
         {
            this._2889.push(param1);
         }
         this._3867();
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
      }
      
      private function _3852() : void
      {
         if(!this._2984)
         {
            if(this._2889.length < 1)
            {
               _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.HIGH_LIGHT));
               _1567(new CommandNotification(CommandNotification.HIDE_TOOL_TIP,_717.DEFAULT));
            }
            else
            {
               _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
                  "showText":this._3869(this._2889),
                  "type":_717.HIGH_LIGHT
               }));
            }
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
      
      public function _10574(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = int(this._2889.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._2889.splice(_loc2_,1);
            this._3867();
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
         }
      }
      
      public function _3868(param1:Object) : void
      {
         this._3870.push(param1);
         this._3867();
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
      }
      
      public function _13772(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(this._3870.indexOf(param1[_loc2_]) == -1)
            {
               this._3870.push(param1[_loc2_]);
               _loc4_ = true;
            }
            _loc2_++;
         }
         if(_loc4_)
         {
            this._3867();
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
         }
      }
      
      public function _3367(param1:Object, param2:Boolean = false) : Boolean
      {
         var _loc3_:_52 = null;
         var _loc4_:_79 = null;
         if(!param1)
         {
            return false;
         }
         if(!this._3860)
         {
            return true;
         }
         if(param1 is _52)
         {
            _loc3_ = param1 as _52;
            if(_loc3_.rootArmatureData)
            {
               return (param2 ? true : this._3316) && this._3860._3865(_loc3_.rootArmatureData.id,_loc3_.id);
            }
            return false;
         }
         if(param1 is _70)
         {
            param1 = (param1 as _70)._1760;
         }
         if(param1 is _79)
         {
            _loc4_ = param1 as _79;
            if(Boolean(_loc4_.parentBoneData) && Boolean(_loc4_.parentBoneData.rootArmatureData))
            {
               return (param2 ? true : this._3315) && this._3860._3866(_loc4_.parentBoneData.rootArmatureData.id,_loc4_.id);
            }
            return false;
         }
         return true;
      }
      
      public function _3861(param1:Object, param2:Boolean) : void
      {
         if(param1 is _52)
         {
            this._3860._3342((param1 as _52).rootArmatureData.id,(param1 as _52).id,param2);
         }
         else if(param1 is _79)
         {
            this._3860._3342((param1 as _79).parentBoneData.rootArmatureData.id,(param1 as _52).id,param2);
         }
      }
      
      public function _3349(param1:_50) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:_52 = null;
         var _loc5_:Array = null;
         var _loc6_:_79 = null;
         var _loc2_:Array = [];
         if(_532.instance._3316)
         {
            _loc3_ = param1._1779;
            for each(_loc4_ in _loc3_)
            {
               if(_532.instance._3367(_loc4_,true))
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         if(_532.instance._3315)
         {
            _loc5_ = param1._1780;
            for each(_loc6_ in _loc5_)
            {
               if(_532.instance._3367(_loc6_,true))
               {
                  _loc2_.push(_loc6_);
               }
            }
         }
         return _loc2_;
      }
      
      public function _3871(param1:Object) : Boolean
      {
         var _loc2_:Object = null;
         if(param1 is _70)
         {
            _loc2_ = (param1 as _70)._1760;
         }
         else
         {
            _loc2_ = param1;
         }
         return this._3870.indexOf(_loc2_) != -1;
      }
      
      private function _3864(param1:StageNotification) : void
      {
         if(this._2873 == _715.NULL)
         {
            this._2484 = null;
         }
         else if(this._2873 == _715.GENERAL || this._2873 == _715.COMIC)
         {
            this._3858 = true;
         }
         else if(this._2873 == _715.ARMATURE || this._2873 == _715.ANIMATE)
         {
            this._3858 = false;
         }
      }
      
      private function _3856(param1:StageNotification) : void
      {
         if(this._3857(this._3870))
         {
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
         }
      }
      
      private function _3857(param1:Array) : Boolean
      {
         var _loc5_:Object = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         for(; _loc4_ < _loc3_; _loc4_++)
         {
            _loc5_ = param1[_loc4_];
            if(this._3858 && _loc5_ is _52)
            {
               _loc5_ = (_loc5_ as _52)._1882;
               if(param1.indexOf(_loc5_) != -1)
               {
                  param1.splice(_loc4_,1);
                  _loc4_--;
                  _loc3_--;
                  continue;
               }
               param1[_loc4_] = _loc5_;
            }
            if(!this._3367(_loc5_))
            {
               param1.splice(_loc4_,1);
               _loc4_--;
               _loc3_--;
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function get _3851() : Boolean
      {
         return this._3849;
      }
      
      public function get _3850() : Boolean
      {
         return this._3848;
      }
      
      public function set _3851(param1:Boolean) : void
      {
         if(this._3849 == param1)
         {
            return;
         }
         this._3849 = param1;
         if(this._3867())
         {
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
         }
         _1567(new StageNotification(StageNotification.UPDATE_ALLOW_BONE_MULTIPLE_SELECTION));
      }
      
      public function set _3850(param1:Boolean) : void
      {
         if(this._3848 == param1)
         {
            return;
         }
         this._3848 = param1;
         if(this._3867())
         {
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
         }
         _1567(new StageNotification(StageNotification.UPDATE_ALLOW_SLOT_MULTIPLE_SELECTION));
      }
      
      private function _3867() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:_52 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:Boolean = false;
         if(!this._3849 && this._2889.length > 1)
         {
            _loc2_ = false;
            _loc4_ = 0;
            _loc5_ = int(this._3870.length);
            while(_loc4_ < _loc5_)
            {
               _loc3_ = this._3870[_loc4_] as _52;
               if(_loc3_)
               {
                  if(_loc2_)
                  {
                     this._3870.splice(_loc4_,1);
                     _loc5_--;
                     _loc4_--;
                     _loc1_ = true;
                  }
                  else
                  {
                     _loc2_ = true;
                  }
               }
               _loc4_++;
            }
         }
         else if(!this._3849 && this._2889.length > 1)
         {
            this._2889 = [this._2889[0]];
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function get _2889() : Array
      {
         return this._3870;
      }
      
      public function set _2889(param1:Array) : void
      {
         var _loc3_:Object = null;
         if(_530.instance._3832)
         {
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
            return;
         }
         this._3857(param1);
         var _loc2_:Boolean = true;
         if(this._2889.length == param1.length)
         {
            _loc2_ = false;
            for each(_loc3_ in this._2889)
            {
               if(param1.indexOf(_loc3_) == -1)
               {
                  _loc2_ = true;
                  break;
               }
            }
         }
         if(_loc2_)
         {
            this._3870 = param1;
            this._3867();
            _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
         }
      }
      
      public function set _14440(param1:Array) : void
      {
         var _loc3_:Object = null;
         if(_530.instance._3832)
         {
            this._14439();
            return;
         }
         this._3857(param1);
         var _loc2_:Boolean = true;
         if(this._2889.length == param1.length)
         {
            _loc2_ = false;
            for each(_loc3_ in this._2889)
            {
               if(param1.indexOf(_loc3_) == -1)
               {
                  _loc2_ = true;
                  break;
               }
            }
         }
         if(_loc2_)
         {
            this._3870 = param1;
            this._3867();
            this._14439();
         }
      }
      
      public function _14439() : void
      {
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS,"noFresh"));
      }
      
      public function get _3855() : _91
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._3870)
         {
            if(_loc1_ is _52 || _loc1_ is _79 && (_loc1_ as _79)._2049)
            {
               return _loc1_ as _91;
            }
            if(_loc1_ is _70 && Boolean((_loc1_ as _70)._1760._2049))
            {
               return (_loc1_ as _70)._1760;
            }
         }
         return null;
      }
      
      public function get _3872() : _52
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._3870)
         {
            if(_loc1_ is _52)
            {
               return _loc1_ as _52;
            }
         }
         return null;
      }
      
      public function get _3150() : _79
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._3870)
         {
            if(_loc1_ is _79)
            {
               return _loc1_ as _79;
            }
            if(_loc1_ is _70)
            {
               return (_loc1_ as _70)._1760;
            }
         }
         return null;
      }
      
      public function get _3862() : Array
      {
         var _loc2_:Object = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._3870)
         {
            if(_loc2_ is _52)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get _3863() : Array
      {
         var _loc2_:Object = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._3870)
         {
            if(_loc2_ is _79)
            {
               _loc1_.push(_loc2_);
            }
            else if(_loc2_ is _70)
            {
               _loc1_.push((_loc2_ as _70)._1760);
            }
         }
         return _loc1_;
      }
      
      public function get _3859() : Object
      {
         return this._2889.length >= 0 ? this._2889[0] : null;
      }
      
      public function get _2484() : Object
      {
         return this._2889.length >= 0 ? this._2889[0] : null;
      }
      
      public function set _2484(param1:Object) : void
      {
         if(param1)
         {
            if(this._2889.length == 1 && this._2889[0] == param1)
            {
               return;
            }
            if(param1 is _52 && !this._3316 || (param1 is _79 || param1 is _70) && !this._3315)
            {
               return;
            }
            this._3870 = [param1];
         }
         else
         {
            if(this._3870.length == 0)
            {
               return;
            }
            this._3870 = [];
         }
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_ITEMS));
      }
      
      public function get _3316() : Boolean
      {
         return !!this._3860 ? this._3860.bone : false;
      }
      
      public function get _3315() : Boolean
      {
         if(this._2873 == _715.NULL)
         {
            return false;
         }
         if(this._2873 == _715.GENERAL)
         {
            return true;
         }
         return !!this._3860 ? this._3860.image : false;
      }
      
      public function get selectableFilter() : _759
      {
         return this._3860;
      }
      
      public function set selectableFilter(param1:_759) : void
      {
         if(this._3860 == param1)
         {
            return;
         }
         this._3860 = param1;
         this._3856(null);
      }
      
      private function get _2873() : _715
      {
         return (_1568.appModel as _638)._2220._2873;
      }
      
      public function _14529() : Boolean
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._3870)
         {
            if(!(_loc1_ is _52))
            {
               return false;
            }
         }
         return true;
      }
      
      public function _14509() : Boolean
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._3870)
         {
            if(!(_loc1_ is _79))
            {
               return false;
            }
         }
         return true;
      }
      
      public function _14526() : Boolean
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this._3870)
         {
            if(!(_loc1_ is _70))
            {
               return false;
            }
         }
         return true;
      }
      
      public function _14530() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_52 = null;
         if(this._3870.length < 1)
         {
            return false;
         }
         _loc1_ = 0;
         _loc2_ = int(this._3870.length);
         while(_loc1_ < _loc2_)
         {
            if(this._3870[_loc1_] is _52)
            {
               _loc3_ = this._3870[_loc1_] as _52;
               if(_loc3_._1957 == false)
               {
                  return false;
               }
            }
            _loc1_++;
         }
         return true;
      }
      
      public function get _14528() : Array
      {
         var _loc2_:_52 = null;
         var _loc3_:Object = null;
         var _loc1_:Array = [];
         for each(_loc3_ in this._3870)
         {
            if(_loc3_ is _52)
            {
               _loc2_ = _loc3_ as _52;
               if(_loc2_._1957)
               {
                  _loc1_.push(_loc3_);
               }
            }
         }
         return _loc1_;
      }
      
      public function _14527() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_52 = null;
         _loc1_ = 0;
         _loc2_ = int(this._3870.length);
         while(_loc1_ < _loc2_)
         {
            if(this._3870[_loc1_] is _52)
            {
               _loc3_ = this._3870[_loc1_] as _52;
               if(_loc3_._1980 || _loc3_._1957)
               {
                  return true;
               }
            }
            _loc1_++;
         }
         return false;
      }
   }
}


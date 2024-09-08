package _586
{
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1404._1407;
   import _24.Shortcut;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._524;
   import _521._530;
   import _541._540;
   import _639._642;
   import _708._716;
   import _710._711;
   import _710._712;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._91;
   import _822._821;
   import _948._947;
   import _953._954;
   
   public class _588 extends _592
   {
      private const BONE_INTERACTION_SIZE_MIN:int = 20;
      
      private var _5015:Boolean;
      
      private var _12963:Number = 1;
      
      protected var _5018:Array;
      
      public function _588()
      {
         this._5018 = [];
         super();
         _5005 = CommandNotification.MODIFY_BONE_TRANSFORM;
         _5004 = CommandNotification.MODIFY_BONE_FRAME_TRANSFORM;
         _5006 = CommandNotification.MODIFY_BASIC_BONE_FRAME_TRANSFORM;
         _5007 = CommandNotification.MODIFY_COMICOBJECT_TRANSFORM;
         _11406 = CommandNotification.MODIFY_MULT_BONE_FRAME_TRANSFORM;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.START_MOVE_BONE,this._5025);
         _1565(StageNotification.START_TRANSFORM,this._5025);
         _1565(StageNotification.STOP_TRANSFORM,this._5026);
         _1565(StageNotification.STOP_MOVE_BONE,this._5026);
         _1565(StageNotification.START_PICK,this._4524);
         _1565(StageNotification.START_EDIT_FFD,this._5020);
         _1565(StageNotification.OVER_FFD,this._5002);
         _1565(StageNotification.UPDATE_BONE_COLOR,this._5014);
         _1565(StageNotification.START_WEIGHT_TOOL,this._4388,100);
         _1565(StageNotification.START_EDIT_RIG,this._5019);
         _1565(StageNotification.CHANGE_TRANSFORM_MODEL,this._10753);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11407);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11626);
         _1565(StageNotification.UPDATE_BONE_INTERACTION_AREA,this._12959);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         this._3198.mouseChildren = true;
         this._3198.mouseEnabled = true;
         this._3198.addEventListener(ListEvent.ITEM_ROLL_OVER,this._4990);
         this._3198.addEventListener(ListEvent.ITEM_ROLL_OUT,this._4991);
         this._3198.addEventListener(ListEvent.ITEM_MOUSE_DOWN,this._5011);
         this._3198.addEventListener(ListEvent.ITEM_CLICK,this._4992);
         this._3198.addEventListener(ListEvent.ITEM_RIGHT_CLICK,this._5009);
      }
      
      private function _4023(param1:StageNotification) : void
      {
         this._12960();
      }
      
      public function _10459(param1:Number) : void
      {
         this._12963 = param1;
         this._12960();
      }
      
      private function _12960() : void
      {
         var _loc1_:int = 0;
         if(_2226._2889.length == 1 && _2226._3150 != null && _2226._3150._2049 && _2226._3150._2049._2165)
         {
            if(_821._12962)
            {
               _1567(new StageNotification(StageNotification.UPDATE_BONE_INTERACTION_AREA,false));
            }
         }
         else
         {
            _loc1_ = _642.getInstance().boneSize * this._12963;
            if(!_821._12962 && _loc1_ < this.BONE_INTERACTION_SIZE_MIN)
            {
               _1567(new StageNotification(StageNotification.UPDATE_BONE_INTERACTION_AREA,true));
            }
            else if(_821._12962 && _loc1_ > this.BONE_INTERACTION_SIZE_MIN)
            {
               _1567(new StageNotification(StageNotification.UPDATE_BONE_INTERACTION_AREA,false));
            }
         }
      }
      
      private function _12959(param1:StageNotification) : void
      {
         _821._12962 = Boolean(param1.data);
         if(this._3198)
         {
            this._3198._12961();
         }
      }
      
      private function _10753(param1:StageNotification) : void
      {
         _10760 = int(param1.data);
      }
      
      private function _5014(param1:StageNotification) : void
      {
         if(this._3198)
         {
            this._3198._3194();
         }
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.START_MOVE_BONE,this._5025);
         _1564(StageNotification.START_TRANSFORM,this._5025);
         _1564(StageNotification.STOP_TRANSFORM,this._5026);
         _1564(StageNotification.STOP_MOVE_BONE,this._5026);
         _1564(StageNotification.START_PICK,this._4524);
         _1564(StageNotification.START_EDIT_FFD,this._5020);
         _1564(StageNotification.OVER_FFD,this._5002);
         _1564(StageNotification.START_WEIGHT_TOOL,this._4388);
         _1564(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1564(StageNotification.START_EDIT_RIG,this._5019);
         _1564(StageNotification.STOP_EDIT_RIG,this._5022);
         _1564(StageNotification.CHANGE_TRANSFORM_MODEL,this._10753);
         _1564(StageNotification.START_EDIT_BOUNDINGBOX,this._11407);
         _1564(StageNotification.START_EDIT_MESH_UV,this._11626);
         _1564(StageNotification.UPDATE_BONE_INTERACTION_AREA,this._12959);
         this._3198.mouseChildren = false;
         this._3198.mouseEnabled = false;
         this._3198.removeEventListener(ListEvent.ITEM_ROLL_OVER,this._4990);
         this._3198.removeEventListener(ListEvent.ITEM_ROLL_OUT,this._4991);
         this._3198.removeEventListener(ListEvent.ITEM_MOUSE_DOWN,this._5011);
         this._3198.removeEventListener(ListEvent.ITEM_CLICK,this._4992);
         this._3198.removeEventListener(ListEvent.ITEM_RIGHT_CLICK,this._5009);
         this._3198.removeEventListener(IndexChangeEvent.CHANGING,this._5010);
      }
      
      private function _5020(param1:StageNotification) : void
      {
         this.dispose();
         _1565(StageNotification.STOP_EDIT_FFD,this._5023);
      }
      
      private function _5023(param1:StageNotification) : void
      {
         _1564(StageNotification.STOP_EDIT_FFD,this._5023);
         start();
      }
      
      private function _11626(param1:StageNotification) : void
      {
         this.dispose();
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11627);
      }
      
      private function _11627(param1:StageNotification) : void
      {
         _1564(StageNotification.STOP_EDIT_MESH_UV,this._11627);
         start();
      }
      
      private function _11407(param1:StageNotification) : void
      {
         this.dispose();
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11345);
      }
      
      private function _11345(param1:StageNotification) : void
      {
         _1564(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11345);
         start();
      }
      
      private function _4388(param1:StageNotification) : void
      {
         this._5015 = true;
         this.dispose();
         _1565(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1565(StageNotification.START_EDIT_RIG,this._5019);
      }
      
      private function _4404(param1:StageNotification) : void
      {
         this._5015 = false;
         _1564(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         start();
      }
      
      private function _5019(param1:StageNotification) : void
      {
         if(this._5015)
         {
            start();
         }
         _1565(StageNotification.STOP_EDIT_RIG,this._5022,100);
      }
      
      private function _5022(param1:StageNotification) : void
      {
         if(this._5015)
         {
            this.dispose();
            _1565(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         }
         _1564(StageNotification.STOP_EDIT_RIG,this._5022);
         _1565(StageNotification.START_EDIT_RIG,this._5019);
      }
      
      private function _5002(param1:StageNotification) : void
      {
         if(param1.data)
         {
            this._3198._5021 = null;
            this._3198.mouseEnabled = false;
            this._3198.mouseChildren = false;
         }
         else
         {
            this._3198.mouseEnabled = true;
            this._3198.mouseChildren = true;
         }
      }
      
      private function _5025(param1:StageNotification) : void
      {
         this._3198._5024 = false;
      }
      
      private function _5026(param1:StageNotification) : void
      {
         this._3198._5024 = true;
      }
      
      private function _4524(param1:StageNotification) : void
      {
         this._1565(StageNotification.STOP_PICK,this._4439);
         this._3198.addEventListener(IndexChangeEvent.CHANGING,this._5010);
      }
      
      private function _4439(param1:StageNotification) : void
      {
         this._1564(StageNotification.STOP_PICK,this._4439);
         if(this._3198)
         {
            this._3198.removeEventListener(IndexChangeEvent.CHANGING,this._5010);
         }
      }
      
      private function _5010(param1:IndexChangeEvent) : void
      {
         param1.preventDefault();
      }
      
      private function _4990(param1:ListEvent) : void
      {
         if(this._14634(param1))
         {
            _1567(new StageNotification(StageNotification.ROLLOVER_BONE,(param1.itemRenderer as _947)._1823));
         }
      }
      
      private function _14634(param1:ListEvent) : Boolean
      {
         var _loc2_:_52 = null;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         if(_530.instance._3832)
         {
            _loc2_ = (param1.itemRenderer as _947)._1823;
            _loc3_ = _530.instance._14525;
            if(!_loc3_)
            {
               return true;
            }
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_ == _loc2_)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      private function _4991(param1:ListEvent) : void
      {
         _1567(new StageNotification(StageNotification.ROLLOUT_BONE,(param1.itemRenderer as _947)._1823));
      }
      
      private function _5011(param1:ListEvent) : void
      {
         if(!Shortcut._1677() && _3176._3332 != _716.POSE && _3176._3332 != _716.CREATE_BONE)
         {
            _5016();
            _524._3785(true);
         }
         _3176._2581();
      }
      
      private function _4992(param1:ListEvent) : void
      {
         if(Shortcut._1677())
         {
            _1567(new CommandNotification(CommandNotification.ADD_REMOVE_SELECT_ITEM,param1.item));
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,[param1.item]));
         }
         if(_530.instance._3832)
         {
            _1567(new StageNotification(StageNotification.PICK_ITEM,param1.item));
            _524._3785("click","pick");
         }
      }
      
      private function _5009(param1:ListEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         if(_530.instance._3832)
         {
            return;
         }
         if(_2226._2889.indexOf(param1.item) != -1)
         {
            _loc3_ = _2226._3862;
            if(_loc3_.length != _2226._2889.length)
            {
               _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc3_));
               param1.stopPropagation();
               return;
            }
            _loc2_ = _2226._2889;
         }
         else
         {
            _loc2_ = [param1.item];
            _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc2_));
         }
         this._3975._3934(_711.STAGE,_712.BONE,_loc2_);
         param1.stopPropagation();
      }
      
      public function _5008(param1:Array) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:Object = null;
         if(!_2227)
         {
            return;
         }
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         for each(_loc3_ in this._5018)
         {
            _loc3_._2022 = false;
         }
         this._5018 = [];
         for each(_loc4_ in param1)
         {
            if(_loc4_ is _52)
            {
               _loc2_.push(_loc4_);
            }
            else if(_loc4_ is _79)
            {
               _loc3_ = (_loc4_ as _79).parentBoneData;
               if(_loc3_)
               {
                  _loc3_._2022 = true;
                  this._5018.push(_loc3_);
               }
            }
            else if(_loc4_ is _70)
            {
               if((_loc4_ as _70)._1760)
               {
                  _loc3_ = (_loc4_ as _70)._1760.parentBoneData;
                  if(_loc3_)
                  {
                     _loc3_._2022 = true;
                     this._5018.push(_loc3_);
                  }
               }
            }
         }
         this._3198._2889 = _loc2_;
         this._3198._5013();
      }
      
      public function get _3198() : _954
      {
         return _5017 as _954;
      }
      
      override public function get _5012() : _91
      {
         return !!this._3198 ? this._3198._5021 : null;
      }
      
      protected function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
   }
}


package _1088
{
   import _1038._1039;
   import _1045.SkinnableDataContainer;
   import _1045._1070;
   import _1177.CollectionEvent;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import _1177.UIEvent;
   import _1177._1178;
   import _1193._1192;
   import egret.core._1133;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   use namespace ns_egret;
   
   public class _1094 extends SkinnableDataContainer
   {
      public static const NO_SELECTION:int = -1;
      
      ns_egret static const NO_PROPOSED_SELECTION:int = -2;
      
      ns_egret static var _2469:int = -3;
      
      private static const TYPE_MAP:Object = {
         "rollOver":"itemRollOver",
         "rollOut":"itemRollOut"
      };
      
      ns_egret var _2465:Boolean = false;
      
      private var dataProviderChanged:Boolean;
      
      private var _8436:String = "label";
      
      private var _8431:Boolean;
      
      private var _7816:Function;
      
      private var _8006:Boolean = false;
      
      private var _8433:Boolean = false;
      
      ns_egret var _2461:int = -2;
      
      ns_egret var _2480:int = -1;
      
      ns_egret var _2460:Boolean = false;
      
      ns_egret var _2459:Boolean = false;
      
      ns_egret var _2468:*;
      
      private var _2482:*;
      
      private var _8435:Boolean = false;
      
      ns_egret var _2464:Boolean = false;
      
      public function _1094()
      {
         super();
         _2576 = true;
      }
      
      override public function set dataProvider(param1:_1039) : void
      {
         if(dataProvider)
         {
            dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457);
         }
         this.dataProviderChanged = true;
         this.ns_egret::_2465 = true;
         if(param1)
         {
            param1.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457,false,0,true);
         }
         super.dataProvider = param1;
         _2466();
      }
      
      override public function set layout(param1:_1192) : void
      {
         if(Boolean(param1) && this._6056)
         {
            param1._6056 = true;
         }
         super.layout = param1;
      }
      
      public function get _5987() : String
      {
         return this._8436;
      }
      
      public function set _5987(param1:String) : void
      {
         if(param1 == this._8436)
         {
            return;
         }
         this._8436 = param1;
         this._8431 = true;
         _2466();
      }
      
      public function get _6146() : Function
      {
         return this._7816;
      }
      
      public function set _6146(param1:Function) : void
      {
         if(param1 == this._7816)
         {
            return;
         }
         this._7816 = param1;
         this._8431 = true;
         _2466();
      }
      
      public function get _6678() : Boolean
      {
         return this._8006;
      }
      
      public function set _6678(param1:Boolean) : void
      {
         if(param1 == this._8006)
         {
            return;
         }
         this._8006 = param1;
         if(param1)
         {
            this._8433 = true;
            _2466();
         }
      }
      
      public function get selectedIndex() : int
      {
         if(this.ns_egret::_2461 != ns_egret::NO_PROPOSED_SELECTION)
         {
            return this.ns_egret::_2461;
         }
         return this.ns_egret::_2480;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         this.ns_egret::_2475(param1,false);
      }
      
      ns_egret function _2475(param1:int, param2:Boolean = false) : void
      {
         if(param1 == this.selectedIndex)
         {
            return;
         }
         if(param2)
         {
            this.ns_egret::_2459 = this.ns_egret::_2459 || param2;
         }
         this.ns_egret::_2461 = param1;
         _2466();
      }
      
      public function get _2484() : *
      {
         if(this.ns_egret::_2468 !== undefined)
         {
            return this.ns_egret::_2468;
         }
         if(this.ns_egret::_2460 && this.selectedIndex == ns_egret::_2469)
         {
            return this._2482;
         }
         if(this.selectedIndex == NO_SELECTION || dataProvider == null)
         {
            return undefined;
         }
         return dataProvider.length > this.selectedIndex ? dataProvider.getItemAt(this.selectedIndex) : undefined;
      }
      
      public function set _2484(param1:*) : void
      {
         this.ns_egret::_2479(param1,false);
      }
      
      ns_egret function _2479(param1:*, param2:Boolean = false) : void
      {
         if(this._2484 === param1)
         {
            return;
         }
         if(param2)
         {
            this.ns_egret::_2459 = this.ns_egret::_2459 || param2;
         }
         this.ns_egret::_2468 = param1;
         _2466();
      }
      
      public function get _6056() : Boolean
      {
         return !!layout ? layout._6056 : this._8435;
      }
      
      public function set _6056(param1:Boolean) : void
      {
         if(param1 == this._6056)
         {
            return;
         }
         this._8435 = param1;
         if(layout)
         {
            layout._6056 = param1;
         }
      }
      
      override protected function _2476() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super._2476();
         if(this.dataProviderChanged)
         {
            this.dataProviderChanged = false;
            this.ns_egret::_2465 = false;
            if(this.selectedIndex >= 0 && dataProvider && this.selectedIndex < dataProvider.length)
            {
               this._2483(this.selectedIndex,true);
            }
            else if(this._6678)
            {
               this.ns_egret::_2461 = 0;
            }
            else
            {
               this.ns_egret::_2475(-1,false);
            }
         }
         if(this._8433)
         {
            this._8433 = false;
            if(this._6678 && this.selectedIndex == NO_SELECTION && dataProvider && dataProvider.length > 0)
            {
               this.ns_egret::_2461 = 0;
            }
         }
         if(this.ns_egret::_2468 !== undefined)
         {
            if(dataProvider)
            {
               this.ns_egret::_2461 = dataProvider.getItemIndex(this.ns_egret::_2468);
            }
            else
            {
               this.ns_egret::_2461 = NO_SELECTION;
            }
            if(this.ns_egret::_2460 && this.ns_egret::_2461 == -1)
            {
               this.ns_egret::_2461 = ns_egret::_2469;
               this._2482 = this.ns_egret::_2468;
            }
            this.ns_egret::_2468 = undefined;
         }
         var _loc1_:Boolean = false;
         if(this.ns_egret::_2461 != ns_egret::NO_PROPOSED_SELECTION)
         {
            _loc1_ = this._2477();
         }
         if(this.ns_egret::_2464)
         {
            this.ns_egret::_2464 = false;
            if(!_loc1_)
            {
               dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
            }
         }
         if(this._8431)
         {
            if(_2490 != null)
            {
               if(Boolean(layout) && layout._6056)
               {
                  for each(_loc2_ in _2490._7581())
                  {
                     this._8432(_loc2_);
                  }
               }
               else
               {
                  _loc3_ = _2490._2249;
                  _loc2_ = 0;
                  while(_loc2_ < _loc3_)
                  {
                     this._8432(_loc2_);
                     _loc2_++;
                  }
               }
            }
            this._8431 = false;
         }
      }
      
      private function _8432(param1:int) : void
      {
         var _loc2_:_1070 = _2490.getElementAt(param1) as _1070;
         if(_loc2_)
         {
            _loc2_.label = this._7442(_loc2_.data);
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2490)
         {
            if(this._8435 && Boolean(_2490.layout))
            {
               _2490.layout._6056 = true;
            }
            _2490.addEventListener(RendererExistenceEvent.RENDERER_ADD,this._2603);
            _2490.addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this._2601);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == _2490)
         {
            _2490.removeEventListener(RendererExistenceEvent.RENDERER_ADD,this._2603);
            _2490.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE,this._2601);
         }
      }
      
      override public function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         this._2483(param2,this.ns_egret::_2471(param2));
         return super._2481(param1,param2,param3);
      }
      
      override public function _7442(param1:Object) : String
      {
         if(this._7816 != null)
         {
            return this._7816(param1);
         }
         if(param1 is String)
         {
            return String(param1);
         }
         if(param1 is XML)
         {
            if(Boolean(param1.hasOwnProperty(this._5987)) && param1[this._5987].length() != 0)
            {
               param1 = param1[this._5987];
            }
         }
         else if(param1 is Object)
         {
            if(Boolean(param1.hasOwnProperty(this._5987)) && param1[this._5987] != null)
            {
               param1 = param1[this._5987];
            }
         }
         if(param1 is String)
         {
            return String(param1);
         }
         if(param1 !== null)
         {
            return param1.toString();
         }
         return " ";
      }
      
      protected function _2483(param1:int, param2:Boolean) : void
      {
         if(!_2490)
         {
            return;
         }
         var _loc3_:_1070 = _2490.getElementAt(param1) as _1070;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selected = param2;
      }
      
      ns_egret function _2471(param1:int) : Boolean
      {
         return param1 == this.selectedIndex;
      }
      
      protected function _2477(param1:Boolean = true) : Boolean
      {
         var _loc4_:IndexChangeEvent = null;
         var _loc2_:int = !!dataProvider ? dataProvider.length - 1 : -1;
         var _loc3_:int = this.ns_egret::_2480;
         if(!this.ns_egret::_2460 || this.ns_egret::_2461 != ns_egret::_2469)
         {
            if(this.ns_egret::_2461 < NO_SELECTION)
            {
               this.ns_egret::_2461 = NO_SELECTION;
            }
            if(this.ns_egret::_2461 > _loc2_)
            {
               this.ns_egret::_2461 = _loc2_;
            }
            if(this._6678 && this.ns_egret::_2461 == NO_SELECTION && dataProvider && dataProvider.length > 0)
            {
               this.ns_egret::_2461 = ns_egret::NO_PROPOSED_SELECTION;
               this.ns_egret::_2459 = false;
               return false;
            }
         }
         var _loc5_:int = this.ns_egret::_2461;
         if(this.ns_egret::_2459)
         {
            (_loc4_ = new IndexChangeEvent(IndexChangeEvent.CHANGING,false,true)).oldIndex = this.ns_egret::_2480;
            _loc4_.newIndex = this.ns_egret::_2461;
            if(!dispatchEvent(_loc4_))
            {
               this._2483(this.ns_egret::_2461,false);
               this.ns_egret::_2461 = ns_egret::NO_PROPOSED_SELECTION;
               this.ns_egret::_2459 = false;
               return false;
            }
         }
         this.ns_egret::_2480 = _loc5_;
         this.ns_egret::_2461 = ns_egret::NO_PROPOSED_SELECTION;
         if(_loc3_ != NO_SELECTION)
         {
            this._2483(_loc3_,false);
         }
         if(this.ns_egret::_2480 != NO_SELECTION)
         {
            this._2483(this.ns_egret::_2480,true);
         }
         if(param1)
         {
            if(this.ns_egret::_2459)
            {
               (_loc4_ = new IndexChangeEvent(IndexChangeEvent.CHANGE)).oldIndex = _loc3_;
               _loc4_.newIndex = this.ns_egret::_2480;
               dispatchEvent(_loc4_);
               this.ns_egret::_2459 = false;
            }
            dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
         }
         return true;
      }
      
      protected function _2478(param1:int, param2:Boolean = false) : void
      {
         if(this.ns_egret::_2461 != ns_egret::NO_PROPOSED_SELECTION)
         {
            this.ns_egret::_2461 = param1;
         }
         else
         {
            this.ns_egret::_2480 = param1;
         }
         this.ns_egret::_2464 = true;
         _2466();
      }
      
      protected function _2486(param1:int) : void
      {
         if(this.ns_egret::_2465)
         {
            return;
         }
         if(this.selectedIndex == NO_SELECTION)
         {
            if(this._6678)
            {
               this._2478(param1,true);
            }
         }
         else if(param1 <= this.selectedIndex)
         {
            this._2478(this.selectedIndex + 1,true);
         }
      }
      
      protected function _2485(param1:int) : void
      {
         if(this.selectedIndex == NO_SELECTION || this.ns_egret::_2465)
         {
            return;
         }
         if(param1 == this.selectedIndex)
         {
            if(this._6678 && dataProvider && dataProvider.length > 0)
            {
               if(param1 == 0)
               {
                  this.ns_egret::_2461 = 0;
                  _2466();
               }
               else
               {
                  this.ns_egret::_2475(0,false);
               }
            }
            else
            {
               this._2478(-1,false);
            }
         }
         else if(param1 < this.selectedIndex)
         {
            this._2478(this.selectedIndex - 1,false);
         }
      }
      
      protected function _2603(param1:RendererExistenceEvent) : void
      {
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this._8434);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this._8434);
      }
      
      protected function _2601(param1:RendererExistenceEvent) : void
      {
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeEventListener(MouseEvent.ROLL_OVER,this._8434);
         _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this._8434);
      }
      
      private function _8434(param1:MouseEvent) : void
      {
         var _loc3_:_1070 = null;
         var _loc2_:String = param1.type;
         _loc2_ = TYPE_MAP[_loc2_];
         if(hasEventListener(_loc2_))
         {
            _loc3_ = param1.currentTarget as _1070;
            this.ns_egret::_2473(param1,_loc2_,_loc3_);
         }
      }
      
      ns_egret function _2473(param1:MouseEvent, param2:String, param3:_1070) : void
      {
         var _loc4_:int = -1;
         if(param3)
         {
            _loc4_ = param3.itemIndex;
         }
         else
         {
            _loc4_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         var _loc5_:ListEvent = new ListEvent(param2,false,false,param1.localX,param1.localY,param1.relatedObject,param1.ctrlKey,param1.altKey,param1.shiftKey,param1.buttonDown,param1.delta,_loc4_,dataProvider.getItemAt(_loc4_),param3);
         dispatchEvent(_loc5_);
      }
      
      protected function _2457(param1:CollectionEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Array = param1.items;
         if(param1.kind == _1178.ADD)
         {
            _loc3_ = int(_loc2_.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this._2486(param1.location + _loc4_);
               _loc4_++;
            }
         }
         else if(param1.kind == _1178.REMOVE)
         {
            _loc3_ = int(_loc2_.length);
            _loc4_ = _loc3_ - 1;
            while(_loc4_ >= 0)
            {
               this._2485(param1.location + _loc4_);
               _loc4_--;
            }
         }
         else if(param1.kind == _1178.MOVE)
         {
            this._2485(param1.oldLocation);
            this._2486(param1.location);
         }
         else if(param1.kind == _1178.RESET)
         {
            if(dataProvider.length == 0)
            {
               this.ns_egret::_2475(NO_SELECTION,false);
            }
            else
            {
               this.dataProviderChanged = true;
               _2466();
            }
         }
         else if(param1.kind == _1178.REFRESH)
         {
            this._2462();
         }
      }
      
      protected function _2462() : void
      {
         this.ns_egret::_2475(NO_SELECTION,false);
      }
   }
}


package _127
{
   import _1038._1037;
   import _1038._1039;
   import _1045._1046;
   import _1045._1070;
   import _1177.CollectionEvent;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import _1177.UIEvent;
   import _1177._1178;
   import egret.core._1133;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class _130 extends _1046
   {
      public static const NO_SELECTION:int = -1;
      
      public static const NO_PROPOSED_SELECTION:int = -2;
      
      public static var _2469:int = -3;
      
      private static const TYPE_MAP:Object = {
         "rollOver":"itemRollOver",
         "rollOut":"itemRollOut",
         "click":"itemClick",
         "mouseDown":"itemMouseDown",
         "mouseUp":"itemMouseUp"
      };
      
      protected var _2465:Boolean = false;
      
      protected var _2461:int = -2;
      
      protected var _2468:*;
      
      protected var _2480:int = -1;
      
      protected var _2482:*;
      
      protected var _2460:Boolean = false;
      
      protected var _2459:Boolean = false;
      
      protected var _2464:Boolean = false;
      
      protected var dataProviderChanged:Boolean = false;
      
      public function _130()
      {
         super();
         addEventListener(RendererExistenceEvent.RENDERER_ADD,this._2472);
         addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this._2463);
      }
      
      protected function _2472(param1:RendererExistenceEvent) : void
      {
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(MouseEvent.ROLL_OVER,this._2458);
         _loc2_.addEventListener(MouseEvent.ROLL_OUT,this._2458);
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this._2458);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._2458);
         _loc2_.addEventListener(MouseEvent.CLICK,this._2458);
      }
      
      protected function _2463(param1:RendererExistenceEvent) : void
      {
         var _loc2_:DisplayObject = param1._2487 as DisplayObject;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeEventListener(MouseEvent.ROLL_OVER,this._2458);
         _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this._2458);
         _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._2458);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._2458);
         _loc2_.removeEventListener(MouseEvent.CLICK,this._2458);
      }
      
      private function _2458(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.type;
         _loc2_ = TYPE_MAP[_loc2_];
         if(hasEventListener(_loc2_))
         {
            this._2473(param1,_loc2_,param1.currentTarget as _1070);
         }
      }
      
      protected function _2475(param1:int, param2:Boolean = false) : void
      {
         if(param1 == this.selectedIndex)
         {
            return;
         }
         if(param2)
         {
            this._2459 = this._2459 || param2;
         }
         this._2461 = param1;
         _2466();
      }
      
      protected function _2479(param1:*, param2:Boolean = false) : void
      {
         if(this._2484 === param1)
         {
            return;
         }
         if(param2)
         {
            this._2459 = this._2459 || param2;
         }
         this._2468 = param1;
         _2466();
      }
      
      protected function _2478(param1:int, param2:Boolean = false) : void
      {
         if(this._2461 != NO_PROPOSED_SELECTION)
         {
            this._2461 = param1;
         }
         else
         {
            this._2480 = param1;
         }
         this._2464 = true;
         _2466();
      }
      
      protected function _2483(param1:int, param2:Boolean) : void
      {
         var _loc3_:_1070 = getElementAt(param1) as _1070;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selected = param2;
      }
      
      protected function _2471(param1:int) : Boolean
      {
         return param1 == this.selectedIndex;
      }
      
      protected function _2486(param1:int) : void
      {
         if(this._2465)
         {
            return;
         }
         if(param1 <= this.selectedIndex)
         {
            this._2478(this.selectedIndex + 1,true);
         }
      }
      
      protected function _2485(param1:int) : void
      {
         if(this.selectedIndex == NO_SELECTION || this._2465)
         {
            return;
         }
         if(param1 == this.selectedIndex)
         {
            this._2478(-1,false);
         }
         else if(param1 < this.selectedIndex)
         {
            this._2478(this.selectedIndex - 1,false);
         }
      }
      
      protected function _2473(param1:MouseEvent, param2:String, param3:_1070) : void
      {
         var _loc4_:int = -1;
         if(param3)
         {
            _loc4_ = param3.itemIndex;
         }
         else
         {
            _loc4_ = getElementIndex(param1.currentTarget as _1133);
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
               this._2475(NO_SELECTION,false);
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
         this._2475(NO_SELECTION,false);
      }
      
      override protected function _2481(param1:_1070, param2:int, param3:Object) : _1070
      {
         this._2483(param2,this._2471(param2));
         return super._2481(param1,param2,param3);
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this.dataProviderChanged)
         {
            this.dataProviderChanged = false;
            this._2465 = false;
            if(this.selectedIndex >= 0 && dataProvider && this.selectedIndex < dataProvider.length)
            {
               this._2483(this.selectedIndex,true);
            }
            else
            {
               this._2475(-1,false);
            }
         }
         if(this._2468 !== undefined)
         {
            if(dataProvider)
            {
               this._2461 = dataProvider.getItemIndex(this._2468);
            }
            else
            {
               this._2461 = NO_SELECTION;
            }
            if(this._2460 && this._2461 == -1)
            {
               this._2461 = _2469;
               this._2482 = this._2468;
            }
            this._2468 = undefined;
         }
         var _loc1_:Boolean = false;
         if(this._2461 != NO_PROPOSED_SELECTION)
         {
            _loc1_ = this._2477();
         }
         if(this._2464)
         {
            this._2464 = false;
            if(!_loc1_)
            {
               dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
            }
         }
      }
      
      protected function _2477(param1:Boolean = true) : Boolean
      {
         var _loc4_:IndexChangeEvent = null;
         var _loc2_:int = !!dataProvider ? dataProvider.length - 1 : -1;
         var _loc3_:int = this._2480;
         if(!this._2460 || this._2461 != _2469)
         {
            if(this._2461 < NO_SELECTION)
            {
               this._2461 = NO_SELECTION;
            }
            if(this._2461 > _loc2_)
            {
               this._2461 = _loc2_;
            }
         }
         var _loc5_:int = this._2461;
         if(this._2459)
         {
            (_loc4_ = new IndexChangeEvent(IndexChangeEvent.CHANGING,false,true)).oldIndex = this._2480;
            _loc4_.newIndex = this._2461;
            if(!dispatchEvent(_loc4_))
            {
               this._2483(this._2461,false);
               this._2461 = NO_PROPOSED_SELECTION;
               this._2459 = false;
               return false;
            }
         }
         this._2480 = _loc5_;
         this._2461 = NO_PROPOSED_SELECTION;
         if(_loc3_ != NO_SELECTION)
         {
            this._2483(_loc3_,false);
         }
         if(this._2480 != NO_SELECTION)
         {
            this._2483(this._2480,true);
         }
         if(param1)
         {
            if(this._2459)
            {
               (_loc4_ = new IndexChangeEvent(IndexChangeEvent.CHANGE)).oldIndex = _loc3_;
               _loc4_.newIndex = this._2480;
               dispatchEvent(_loc4_);
               this._2459 = false;
            }
            dispatchEvent(new UIEvent(UIEvent.VALUE_COMMIT));
         }
         return true;
      }
      
      override public function set dataProvider(param1:_1039) : void
      {
         if(dataProvider)
         {
            dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457);
         }
         this.dataProviderChanged = true;
         this._2465 = true;
         if(param1)
         {
            param1.addEventListener(CollectionEvent.COLLECTION_CHANGE,this._2457,false,0,true);
         }
         super.dataProvider = param1;
         _2466();
      }
      
      public function get _2484() : *
      {
         if(this._2468 !== undefined)
         {
            return this._2468;
         }
         if(this._2460 && this.selectedIndex == _2469)
         {
            return this._2482;
         }
         if(this.selectedIndex == NO_SELECTION || dataProvider == null)
         {
            return undefined;
         }
         return dataProvider.length > this.selectedIndex ? dataProvider.getItemAt(this.selectedIndex) : null;
      }
      
      public function set _2484(param1:*) : void
      {
         this._2479(param1,false);
      }
      
      public function get _2467() : _146
      {
         return this._2474(this._2484) as _146;
      }
      
      public function get selectedIndex() : int
      {
         if(this._2461 != NO_PROPOSED_SELECTION)
         {
            return this._2461;
         }
         return this._2480;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         this._2475(param1,false);
      }
      
      public function _2474(param1:Object) : _1133
      {
         var _loc2_:int = (dataProvider as _1037).getItemIndex(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         return getElementAt(_loc2_);
      }
   }
}


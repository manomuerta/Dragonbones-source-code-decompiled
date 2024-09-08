package _1374
{
   import _1038._1037;
   import _1045._1070;
   import _1177.IndexChangeEvent;
   import _1177.UIEvent;
   import _1376._1377;
   import _1421._1422;
   import _1421._1423;
   import _1421._1427;
   import _1439._1447;
   import egret.core._1133;
   import flash.events.Event;
   import flash.events.FocusEvent;
   
   public class _1385 extends TabGroup
   {
      private var dataProviderChanged:Boolean;
      
      private var _9724:_1393;
      
      public var _9725:_1377;
      
      private var _9720:int = 0;
      
      private var _9719:Array;
      
      public function _1385()
      {
         this._9719 = [];
         super();
         this.skinName = _1447;
         this._9710 = this._9713;
         this.addEventListener(_1427.CLOSING_PANEL,this._9718);
         this.addEventListener(_1427.CLOSE_PANEL,this._9722);
         this.addEventListener(_1427.PANEL_CREATED,this._9717);
      }
      
      override protected function onFocusIn(param1:FocusEvent) : void
      {
         super.onFocusIn(param1);
         var _loc2_:_1423 = new _1423(_1423.DOC_FOCUS_IN,true);
         this.dispatchEvent(_loc2_);
      }
      
      private function _9713(param1:Object) : Class
      {
         if(param1.clazz)
         {
            return param1.clazz;
         }
         return null;
      }
      
      public function _2248(param1:_1393) : void
      {
         dataProvider.addItem(param1);
      }
      
      public function _4922(param1:_1393, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc4_:int = this._9714(param1);
         if(_loc4_ > -1)
         {
            if(param2)
            {
               _2561(_loc4_,param3);
            }
            else
            {
               dataProvider.removeItemAt(_loc4_);
            }
         }
      }
      
      public function get _4919() : _1393
      {
         if(selectedIndex > -1)
         {
            return dataProvider.getItemAt(selectedIndex) as _1393;
         }
         return null;
      }
      
      public function set _4919(param1:_1393) : void
      {
         var _loc2_:int = dataProvider.getItemIndex(param1);
         selectedIndex = _loc2_;
      }
      
      public function _2242(param1:int) : _1393
      {
         return dataProvider.getItemAt(param1) as _1393;
      }
      
      public function _9714(param1:_1393) : int
      {
         return dataProvider.getItemIndex(param1);
      }
      
      override public function set dataProvider(param1:_1037) : void
      {
         super.dataProvider = param1;
         this.dataProviderChanged = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         super._2476();
         if(this.dataProviderChanged)
         {
            this.dataProviderChanged = false;
            while(this._9719.length > 0)
            {
               this._9709(this._9719.shift());
            }
            _loc1_ = 0;
            while(_loc1_ < dataProvider.length)
            {
               this._9712(dataProvider.getItemAt(_loc1_) as _1393);
               _loc1_++;
            }
         }
      }
      
      override protected function _2486(param1:Object, param2:int) : void
      {
         this._9712(param1 as _1393);
         super._2486(param1,param2);
      }
      
      override protected function _2485(param1:Object, param2:int) : void
      {
         this._9709(param1 as _1393);
         super._2485(param1,param2);
      }
      
      private function _9712(param1:_1393) : void
      {
         param1.owner = this;
         var _loc2_:int = int(this._9719.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._9719.splice(_loc2_,1);
         }
         this._9719.unshift(param1);
         invalidateDisplayList();
      }
      
      private function _9709(param1:_1393) : void
      {
         param1.owner = null;
         var _loc2_:int = int(this._9719.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this._9719.splice(_loc2_,1);
         }
         if(this._9719.length > 0)
         {
            selectedIndex = -1;
            this._4919 = this._9719[0] as _1393;
         }
         invalidateDisplayList();
      }
      
      override protected function _2477(param1:int, param2:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_1423 = null;
         super._2477(param1);
         var _loc3_:_1393 = this._4919;
         if(_loc3_)
         {
            _loc4_ = int(this._9719.indexOf(_loc3_));
            if(_loc4_ >= 0)
            {
               this._9719.splice(_loc4_,1);
            }
            this._9719.unshift(_loc3_);
         }
         if(_loc3_ != this._9724)
         {
            (_loc5_ = new _1423(_1423.SELECTED_DOC_CHANGE,true))._3430 = this._9724;
            _loc5_._1642 = _loc3_;
            this.dispatchEvent(_loc5_);
         }
         this._9724 = _loc3_;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2515)
         {
            _2515._6056 = false;
            _2515.addEventListener(_1422.CLOSE,this._9726);
            _2515.addEventListener(_1422.CLOSE_ALL,this._9721);
            _2515.addEventListener(_1422.CLOSE_OTHER,this._9716);
         }
         else if(param2 == this._9725)
         {
            this._9725.addEventListener(UIEvent.OPEN,this._9723);
            this._9725.addEventListener(IndexChangeEvent.CHANGING,this._9715);
         }
      }
      
      private function _9726(param1:Event) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:int = (param1.target as _1070).itemIndex;
         _2561(_loc2_);
      }
      
      protected function _9716(param1:Event) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:int = (param1.target as _1070).itemIndex;
         var _loc3_:Array = [];
         var _loc4_:int = this._2249 - 1;
         while(_loc4_ >= 0)
         {
            if(_loc2_ != _loc4_)
            {
               _2561(_loc4_);
            }
            _loc4_--;
         }
      }
      
      protected function _9721(param1:Event) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:int = (param1.target as _1070).itemIndex;
         var _loc3_:Array = [];
         var _loc4_:int = this._2249 - 1;
         while(_loc4_ >= 0)
         {
            _2561(_loc4_);
            _loc4_--;
         }
      }
      
      protected function _9718(param1:_1427) : void
      {
         var _loc2_:_1393 = param1._4928 as _1393;
         if(!_loc2_.dispatchEvent(param1.clone()))
         {
            param1.preventDefault();
         }
      }
      
      protected function _9722(param1:_1427) : void
      {
         var _loc2_:_1393 = param1._4928 as _1393;
         _loc2_.dispatchEvent(param1.clone());
      }
      
      protected function _9717(param1:_1427) : void
      {
         var _loc2_:_1393 = param1._4928 as _1393;
         _loc2_.dispatchEvent(param1.clone());
      }
      
      protected function _9715(param1:IndexChangeEvent) : void
      {
         param1.preventDefault();
         var _loc2_:Object = this._9725.dataProvider.getItemAt(param1.newIndex);
         var _loc3_:int = dataProvider.getItemIndex(_loc2_);
         selectedIndex = _loc3_;
      }
      
      protected function _9723(param1:UIEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = this._9720;
         while(_loc3_ < this._9719.length)
         {
            _loc4_ = dataProvider.getItemIndex(this._9719[_loc3_]);
            _loc2_.push(dataProvider.getItemAt(_loc4_));
            _loc3_++;
         }
         _loc2_.sortOn("label");
         this._9725.dataProvider = new _1037(_loc2_);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._9711();
      }
      
      private function _9711() : void
      {
         var _loc5_:int = 0;
         var _loc6_:_1133 = null;
         var _loc7_:Number = NaN;
         var _loc8_:_1133 = null;
         this._9720 = 0;
         _2516.owner._2449();
         var _loc1_:int = _2515._2490._2249;
         var _loc2_:Number = 0;
         var _loc3_:int = -1;
         var _loc4_:int = 0;
         while(_loc4_ < this._9719.length)
         {
            _loc5_ = dataProvider.getItemIndex(this._9719[_loc4_]);
            _loc6_ = _2515._2490.getElementAt(_loc5_);
            if(_loc6_)
            {
               _loc2_ += _loc6_.layoutBoundsWidth - 1;
               _loc7_ = _2516.layoutBoundsX - this._9725.layoutBoundsWidth - 5;
               if(_loc4_ == _loc1_ - 1)
               {
                  _loc7_ += this._9725.layoutBoundsWidth;
               }
               if(_loc2_ > _loc7_)
               {
                  _loc6_.visible = false;
                  _loc6_.includeInLayout = false;
               }
               else
               {
                  ++this._9720;
                  _loc6_.visible = true;
                  _loc6_.includeInLayout = true;
                  _loc3_ = Math.max(_loc3_,_loc5_);
               }
            }
            _loc4_++;
         }
         _2515._2449();
         if(_loc1_ <= this._9720 || _loc3_ < 0)
         {
            this._9725.visible = false;
         }
         else
         {
            _loc8_ = _2515._2490.getElementAt(_loc3_);
            this._9725.visible = true;
            this._9725.label = String(_loc1_ - this._9720);
            this._9725.x = _loc8_.layoutBoundsX + _loc8_.layoutBoundsWidth + 5;
         }
      }
   }
}


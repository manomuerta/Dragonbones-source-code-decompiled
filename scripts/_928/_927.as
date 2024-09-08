package _928
{
   import _127._144;
   import _127._165;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _521._532;
   import _521._535;
   import _555._571;
   import _579._580;
   import _586._594;
   import _586._603;
   import _676._677;
   import _676._684;
   import _676._685;
   import _676._700;
   import _703._702;
   import _703._704;
   import _931._932;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _927 extends _165
   {
      private static const imgVisible:Class = _927_imgVisible;
      
      private static const imgSelectable:Class = _927_imgSelectable;
      
      public var _4528:_144;
      
      public var _4510:_144;
      
      public var _6667:_144;
      
      private var _6666:Boolean;
      
      private var _11172:Boolean = false;
      
      public function _927()
      {
         super();
         skinName = _932;
         _6070 = 10;
         height = 22;
         if(this._2880.stage)
         {
            if(!this._2880.stage.hasEventListener(MouseEvent.MOUSE_UP))
            {
               this._2880.stage.addEventListener(MouseEvent.MOUSE_UP,this._6663,true);
            }
            if(!this._2880.stage.hasEventListener(Event.DEACTIVATE))
            {
               this._2880.stage.addEventListener(Event.DEACTIVATE,this._6662);
            }
         }
         addEventListener(MouseEvent.ROLL_OVER,this.itemRollOver);
         addEventListener(MouseEvent.ROLL_OUT,this.itemRollOut);
         addEventListener(MouseEvent.MOUSE_MOVE,this._6664);
      }
      
      private function _6662(param1:Event) : void
      {
         this._2880._4502 = false;
      }
      
      private function _6664(param1:MouseEvent) : void
      {
         if(param1.buttonDown)
         {
            if(this._2880._4502 && !this._6666)
            {
               if(this._2880._4526.length)
               {
                  this._6665(this.vo,this._2880._4526,this._2880._4514);
                  this._6666 = true;
               }
            }
         }
      }
      
      private function itemRollOut(param1:MouseEvent) : void
      {
         this._11172 = false;
         this._3120();
      }
      
      private function itemRollOver(param1:MouseEvent) : void
      {
         this._11172 = true;
         this._3120();
         if(param1.buttonDown)
         {
            if(this._2880._4502)
            {
               if(this._2880._4526.length)
               {
                  this._6665(this.vo,this._2880._4526,this._2880._4514);
               }
            }
         }
      }
      
      private function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:_144 = null;
         super.partAdded(param1,param2);
         if(param2 == this._4528 || param2 == this._4510 || param2 == this._6667)
         {
            _loc3_ = param2 as _144;
            _loc3_.doubleClickEnabled = true;
            _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this._6363);
            _loc3_.addEventListener(MouseEvent.MOUSE_UP,this._6363);
            _loc3_.addEventListener(MouseEvent.CLICK,this._6363);
            _loc3_.addEventListener(MouseEvent.DOUBLE_CLICK,this._6363);
            if(param2 == this._4528)
            {
               this._4528.name = "visible";
               this._4528.addEventListener(Event.CHANGE,this._6659);
            }
            else if(param2 == this._4510)
            {
               this._4510.name = "selectable";
               this._4510.addEventListener(Event.CHANGE,this._6657);
            }
            else if(param2 == this._6667)
            {
               this._6667.addEventListener(Event.CHANGE,this._6661);
            }
         }
         else if(param2 == _2440)
         {
            this._6658();
         }
      }
      
      protected function _6665(param1:Object, param2:String, param3:Boolean) : void
      {
         if(param2 == "selectable")
         {
            this._2880._3950([param1],param3);
         }
         else if(param2 == "visible")
         {
            this._2880._3949([param1],param3,!param3);
         }
      }
      
      protected function _6660(param1:Object, param2:String, param3:Boolean) : void
      {
         this._2880._3209(param1,param2,param3);
      }
      
      private function _6363(param1:MouseEvent) : void
      {
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            this._2880._4502 = true;
            this._6666 = false;
            if(param1.currentTarget.name == "visible")
            {
               this._2880._4526 = "visible";
               this._2880._4514 = !this._4528.selected;
            }
            else if(param1.currentTarget.name == "selectable")
            {
               this._2880._4526 = "selectable";
               this._2880._4514 = !this._4510.selected;
            }
         }
         else if(param1.type == MouseEvent.MOUSE_UP)
         {
            this._2880._4502 = false;
         }
         param1.stopPropagation();
      }
      
      private function _6663(param1:MouseEvent) : void
      {
         this._2880._4502 = false;
      }
      
      private function _6659(param1:Event) : void
      {
         var _loc2_:_702 = data as _702;
         if(_loc2_.parent)
         {
            this._6665(this.vo,"visible",this._4528.selected);
         }
         else
         {
            this._6660(this.vo,"visible",this._4528.selected);
         }
      }
      
      private function _6657(param1:Event) : void
      {
         var _loc2_:_702 = data as _702;
         if(_loc2_.parent)
         {
            this._6665(this.vo,"selectable",this._4510.selected);
         }
         else
         {
            this._6660(this.vo,"selectable",this._4510.selected);
         }
      }
      
      private function _6661(param1:Event) : void
      {
         var _loc2_:_70 = null;
         var _loc3_:_70 = null;
         if(this.vo is _79)
         {
            for each(_loc3_ in _79(this.vo)._1765)
            {
               _loc2_ = _loc3_;
            }
         }
         else
         {
            _loc2_ = this.vo as _70;
         }
         this._2880.switchDisplay(_loc2_);
      }
      
      private function _6658() : void
      {
         this._6667.x = _2440.x;
      }
      
      public function _3120() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:_70 = null;
         if(this.data is _677)
         {
            this._4528._2536 = imgVisible;
            this._4510._2536 = imgSelectable;
         }
         else
         {
            this._4528._2536 = _932.dot;
            this._4510._2536 = _932.dot;
            if(data is _684 || data is _700)
            {
               if(!_535.instance._11294)
               {
                  this._4528.selected = _535.instance._3371((data as _704).vo);
               }
               this._4510.selected = _532.instance._3367((data as _704).vo,true);
            }
         }
         alpha = 1;
         if(data is _685)
         {
            this._4528.visible = false;
            this._4510.visible = false;
            this._6667.visible = true;
            if((this.vo as _70)._2100)
            {
               this._6667.selected = true;
            }
            else
            {
               this._6667.selected = false;
               alpha = 0.5;
            }
         }
         else if(data is _700)
         {
            if((data as _700)._1837._1715.length == 1)
            {
               if(this._2880._3175)
               {
                  _loc1_ = true;
                  for each(_loc2_ in (data as _700)._1837._1765)
                  {
                     _loc1_ = _loc2_._2100;
                  }
                  if(_loc1_)
                  {
                     this._6667.selected = true;
                  }
                  else
                  {
                     this._6667.selected = false;
                     alpha = 0.5;
                  }
                  if(this._11172)
                  {
                     this._6667.visible = true;
                  }
                  else
                  {
                     this._6667.visible = false;
                  }
               }
               else
               {
                  this._6667.visible = false;
               }
            }
            else
            {
               this._6667.visible = false;
            }
            this._4528.visible = true;
            this._4510.visible = true;
         }
         else
         {
            this._4528.visible = true;
            this._4510.visible = true;
            this._6667.visible = false;
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._3120();
         if(data is _685)
         {
            labelDisplay.text = (data as _685).displayVO._13230;
         }
      }
      
      override public function set depth(param1:int) : void
      {
         if(param1 == depth)
         {
            return;
         }
         super.depth = param1;
         this._6658();
      }
      
      private function get vo() : Object
      {
         return (data as _704).vo;
      }
      
      private function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
   }
}


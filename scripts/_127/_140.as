package _127
{
   import _1045.Group;
   import _1045.SkinnableContainer;
   import _1045._1082;
   import _1045._1086;
   import _1374.IconButton;
   import _872._11267;
   import flash.events.MouseEvent;
   
   public class _140 extends SkinnableContainer
   {
      public var _2527:Group;
      
      public var _2526:_11267;
      
      public var _11290:_1086;
      
      public var removeBtn:IconButton;
      
      public var _11289:_1082;
      
      private var _title:String;
      
      private var _data:Object;
      
      private var _2524:Boolean = false;
      
      protected var _2525:Boolean = false;
      
      public function _140()
      {
         super();
         this.percentWidth = 100;
         this.skinName = _141;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
         this._2466();
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         this._2524 = true;
         this._2466();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._2524)
         {
            this._2520();
            this._2524 = false;
         }
         if(this._2525)
         {
            this._2440.visible = this._2440.includeInLayout = !this._2526.selected;
            this._2525 = false;
         }
         this._2526.label = this._title;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2526)
         {
            this._2526.addEventListener(MouseEvent.CLICK,this._2521);
         }
         if(param2 == this.removeBtn)
         {
            this.removeBtn.addEventListener(MouseEvent.CLICK,this._2523);
         }
      }
      
      private function _2521(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._2526:
               this._2525 = true;
               this._2466();
         }
      }
      
      protected function _2520() : void
      {
      }
      
      protected function removeItem() : void
      {
      }
      
      private function _2523(param1:MouseEvent) : void
      {
         this.removeItem();
      }
   }
}


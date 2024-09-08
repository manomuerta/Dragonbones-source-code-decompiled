package _172
{
   import _1045.Button;
   import _1045.Group;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _1374.Window;
   import egret.utils.tr;
   import flash.display.NativeWindowType;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   
   public class Dialog extends Window
   {
      private var _2644:Dictionary;
      
      protected var _2640:Group;
      
      protected var _2642:Group;
      
      public function Dialog()
      {
         this._2644 = new Dictionary();
         super();
         this.type = NativeWindowType.UTILITY;
      }
      
      public function _2641(param1:String) : Button
      {
         if(this._2644[param1])
         {
            return Button(this._2644[param1]);
         }
         return null;
      }
      
      protected function _2556(param1:String) : void
      {
         if(_173.OK_ID == param1)
         {
            this._2643();
         }
         else if(_173.CANCEL_ID == param1)
         {
            this._2637();
         }
      }
      
      protected function _2637() : void
      {
         close();
      }
      
      protected function _2643() : void
      {
         close();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 0;
         _loc1_._2401 = _1188.JUSTIFY;
         this.layout = _loc1_;
         this._2640 = this._2635();
         this._2640.percentWidth = 100;
         this.addElement(this._2640);
         this._2642 = this._2636();
         this.addElement(this._2642);
         this._2634();
      }
      
      protected function _2634() : void
      {
         this._2639(_173.OK_ID);
         this._2639(_173.CANCEL_ID);
      }
      
      protected function _2639(param1:String, param2:String = null) : Button
      {
         var _loc3_:Button = new Button();
         _loc3_.name = param1;
         if(param2 === null)
         {
            _loc3_.label = tr("Dialog." + param1);
         }
         else
         {
            _loc3_.label = param2;
         }
         _loc3_.minWidth = 80;
         _loc3_.minHeight = 25;
         _loc3_.addEventListener(MouseEvent.CLICK,this._2638);
         this._2642.addElement(_loc3_);
         this._2644[param1] = _loc3_;
         return _loc3_;
      }
      
      private function _2638(param1:MouseEvent) : void
      {
         this._2556(param1.currentTarget.name);
      }
      
      protected function _2636() : Group
      {
         var _loc1_:Group = null;
         _loc1_ = new Group();
         var _loc2_:_1189 = new _1189();
         _loc2_.padding = 12;
         _loc2_.verticalAlign = _1196.MIDDLE;
         _loc2_._2401 = _1188.RIGHT;
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      protected function _2635() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         return _loc1_;
      }
   }
}


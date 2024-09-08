package _12908
{
   import _1033._12916;
   import _1045.Button;
   import _1045.CheckBox;
   import _1045.Group;
   import _11106._11108;
   import _11106._12897;
   import _11111._11110;
   import _1185._1189;
   import _834._12904;
   import _97._106;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class _12907 extends Group
   {
      private var _13037:CheckBox;
      
      public function _12907()
      {
         this._13037 = new CheckBox();
         super();
         var _loc1_:_1189 = new _1189();
         _loc1_.verticalAlign = "middle";
         _loc1_.gap = 0;
         layout = _loc1_;
         this.setStyle("size",13);
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._13037.skinName = _12904;
         this._13037.label = tr("Pay.law.agree");
         this._13037.selected = true;
         this._13037.addEventListener(Event.CHANGE,this._13036);
         var _loc1_:Button = new Button();
         _loc1_.skinName = _12916;
         _loc1_.label = tr("Pay.law.agreement");
         _loc1_.addEventListener(MouseEvent.CLICK,this._13035);
         addElement(this._13037);
         addElement(_loc1_);
      }
      
      private function _13036(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      private function _13035(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest(_106.local(_106.PAID_AGREEMENT)),"_blank");
         _11110.instance._12948._13259(_12897.PaidAgreement,_11108.Unknown);
      }
      
      public function get selected() : Boolean
      {
         return this._13037.selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._13037.selected = param1;
      }
   }
}


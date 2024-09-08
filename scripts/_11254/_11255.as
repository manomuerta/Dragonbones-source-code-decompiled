package _11254
{
   import _1033._13223;
   import _1033._13567;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _586._11247;
   import _636.BoundingBoxEvent;
   import _822._11256;
   import _834._12900;
   import _834._838;
   import _97._125;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _11255 extends Group
   {
      public static const ICON_CREATE:String = "/assets/button/boundingBoxCreate";
      
      public static const ICON_DELETE:String = "/assets/button/boundingBoxDelete";
      
      public static const ICON_NEW:String = "/assets/button/boundingBoxNew";
      
      public static const STROKE_COLOR:uint = 1777701;
      
      public static const FILL_COLOR:uint = 2238766;
      
      public static const ALPHA:Number = 1;
      
      public var _11439:Label;
      
      public var _11438:Button;
      
      public var _11374:_11256;
      
      public var _4197:_11256;
      
      public var _11377:_11256;
      
      public var _11373:Label;
      
      private var _2558:_1082;
      
      public function _11255()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         super._2438();
         this._2558 = new _1082();
         this._2558.radius = 5;
         this._2558._2563 = STROKE_COLOR;
         this._2558._2562 = 1;
         this._2558._2564 = 1;
         this._2558.fillColor = FILL_COLOR;
         this._2558.alpha = ALPHA;
         this._2558.width = 211;
         this._2558.height = 65;
         addElement(this._2558);
         _loc1_ = _125._2395(0);
         _loc1_.width = this._2558.width;
         _loc1_.height = this._2558.height;
         _loc2_ = new Group();
         _loc2_.width = this._2558.width;
         _loc2_.height = 28;
         this._11439 = new Label();
         this._11439.text = tr("BoundingBoxPanel.title");
         this._11439.y = 6;
         this._11439.x = 6;
         _loc2_.addElement(this._11439);
         this._11438 = new Button();
         this._11438.skinName = _12900;
         this._11438.right = 0;
         _loc2_.addElement(this._11438);
         _loc1_.addElement(_loc2_);
         this._11374 = new _11256();
         this._11374.skinName = _838;
         this._11374.data = {"icon":ICON_CREATE};
         this._11374.toolTip = tr("BoundingBoxPanel.btn.create");
         this._11374.x = 11;
         this._11374.y = 5;
         this._4197 = new _11256();
         this._4197.skinName = _838;
         this._4197.data = {"icon":ICON_DELETE};
         this._4197.toolTip = tr("BoundingBoxPanel.btn.delete");
         this._4197.x = 40;
         this._4197.y = 5;
         this._11377 = new _11256();
         this._11377.skinName = _838;
         this._11377.data = {"icon":ICON_NEW};
         this._11377.toolTip = tr("BoundingBoxPanel.btn.new");
         this._11377.x = 84;
         this._11377.y = 5;
         var _loc3_:Group = _125._2397();
         this._11373 = new Label();
         this._11373.text = tr("BoundingBoxPanel.vertices",0);
         _loc3_.addElement(this._11373);
         var _loc4_:Group;
         (_loc4_ = new Group()).percentWidth = 100;
         _loc4_.height = 34;
         _loc4_.addElement(this._11374);
         _loc4_.addElement(this._4197);
         var _loc5_:Group;
         (_loc5_ = new Group()).height = 28;
         var _loc6_:_13223 = new _13223(0);
         _loc5_.addElement(_loc6_);
         _loc5_.x = 73;
         _loc5_.y = 3;
         _loc4_.addElement(_loc5_);
         _loc4_.addElement(this._11377);
         var _loc7_:Group;
         (_loc7_ = new Group()).height = 28;
         var _loc8_:_13223 = new _13223(0);
         _loc7_.addElement(_loc8_);
         _loc7_.x = 117;
         _loc7_.y = 3;
         _loc4_.addElement(_loc7_);
         _loc3_.x = 127;
         _loc3_.y = 10;
         _loc4_.addElement(_loc3_);
         var _loc9_:_13567 = new _13567();
         _loc1_.addElement(_loc9_);
         _loc1_.addElement(_loc4_);
         addElement(_loc1_);
         this.addEvent();
      }
      
      private function addEvent() : void
      {
         this._11438.addEventListener(MouseEvent.CLICK,this._2384);
         this._11374.addEventListener(MouseEvent.CLICK,this._4200);
         this._4197.addEventListener(MouseEvent.CLICK,this._6617);
         this._11377.addEventListener(MouseEvent.CLICK,this._11440);
      }
      
      private function _2384(param1:MouseEvent) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.CLOSE_EDIT));
      }
      
      private function _4200(param1:MouseEvent) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.CHANGE_MODE,_11247.BOUNDINGBOX_MODE_CREATE));
      }
      
      private function _6617(param1:MouseEvent) : void
      {
         dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.CHANGE_MODE,_11247.BOUNDINGBOX_MODE_DELETE));
      }
      
      private function _11440(param1:MouseEvent) : void
      {
         if(this._11377.selected)
         {
            dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.CHANGE_MODE,_11247.BOUNDINGBOX_MODE_NEW));
         }
         else
         {
            dispatchEvent(new BoundingBoxEvent(BoundingBoxEvent.CHANGE_MODE,_11247.BOUNDINGBOX_MODE_STOP_NEW));
         }
      }
   }
}


package _877
{
   import _1033._13223;
   import _1033._13567;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1045._1082;
   import _1185._1189;
   import _127._128;
   import _1374.IconButton;
   import _24._26;
   import _586._11505;
   import _636.MeshEvent;
   import _639.HotkeysModel;
   import _822._11256;
   import _822._13551;
   import _834._12900;
   import _834._838;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _11511 extends Group
   {
      private static var _6410:String = "/assets/button/add_vertex";
      
      private static var _6411:String = "/assets/button/add_vertex";
      
      private static var _6420:String = "/assets/button/delete_vertex";
      
      private static var _6409:String = "/assets/button/edit_mesh";
      
      private static var _6413:String = "/assets/button/mesh_outline";
      
      private static var _6415:String = "/assets/button/reset_mesh.png";
      
      private static var _13960:String = "/assets/button/mesh_autoOutline.png";
      
      public static const STROKE_COLOR:uint = 1777701;
      
      public static const FILL_COLOR:uint = 2238766;
      
      public static const ALPHA:Number = 1;
      
      public var _11439:Label;
      
      public var _11438:Button;
      
      public var _6412:_11256;
      
      public var _6417:_11256;
      
      public var _6419:_11256;
      
      public var _6416:_11256;
      
      public var _5613:IconButton;
      
      public var _11649:_128;
      
      public var _13962:IconButton;
      
      public var _11373:Label;
      
      public var _13961:_13551;
      
      private var _2558:_1082;
      
      public function _11511()
      {
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super._2438();
         _loc1_ = 120;
         _loc2_ = 100;
         _loc3_ = 2;
         this._2558 = new _1082();
         this._2558.radius = 5;
         this._2558._2563 = STROKE_COLOR;
         this._2558._2562 = 1;
         this._2558._2564 = 1;
         this._2558.fillColor = FILL_COLOR;
         this._2558.alpha = ALPHA;
         this._2558.width = _loc1_ + _loc2_ + 4;
         this._2558.height = 99;
         addElement(this._2558);
         var _loc4_:Group;
         (_loc4_ = _125._2395(0)).width = this._2558.width;
         _loc4_.height = this._2558.height;
         var _loc5_:Group;
         (_loc5_ = new Group()).width = this._2558.width;
         _loc5_.height = 28;
         this._11439 = new Label();
         this._11439.text = tr("Mesh.property.edit");
         this._11439.y = 10;
         this._11439.x = 8;
         _loc5_.addElement(this._11439);
         this._11438 = new Button();
         this._11438.skinName = _12900;
         this._11438.right = 2;
         this._11438.top = 3;
         this._11649 = new _128();
         this._11649.label = tr("Mesh.tool.deform");
         this._11649.top = 10;
         this._11649.right = 32;
         _loc5_.addElement(this._11438);
         _loc5_.addElement(this._11649);
         _loc4_.addElement(_loc5_);
         var _loc6_:Group = _125._2397(0);
         var _loc7_:Group;
         (_loc7_ = _125._2398()).height = 33;
         _loc7_.width = _loc1_;
         var _loc8_:HotkeysModel = HotkeysModel.getInstance();
         this._6412 = new _11256();
         this._6412.skinName = _838;
         this._6412.data = {"icon":_6410};
         this._6412.toolTip = tr("Mesh.tool.add",_loc8_._11726(_26.MESH_ADD));
         this._6417 = new _11256();
         this._6417.skinName = _838;
         this._6417.data = {"icon":_6409};
         this._6417.toolTip = tr("Mesh.tool.modify",_loc8_._11726(_26.MESH_EDIT));
         this._6419 = new _11256();
         this._6419.skinName = _838;
         this._6419.data = {"icon":_6420};
         this._6419.toolTip = tr("Mesh.tool.delete",_loc8_._11726(_26.MESH_DELETE));
         this._6416 = new _11256();
         this._6416.skinName = _838;
         this._6416.data = {"icon":_6413};
         this._6416.toolTip = tr("Mesh.tool.outline");
         this._5613 = new IconButton();
         this._5613.icon = _6415;
         this._5613.toolTip = tr("Mesh.tool.reset");
         _loc7_.addElement(this._6417);
         _loc7_.addElement(this._6412);
         _loc7_.addElement(this._6419);
         var _loc9_:Group;
         (_loc9_ = new Group()).width = _loc3_;
         _loc7_.addElement(_loc9_);
         var _loc10_:Group;
         (_loc10_ = _125._13692()).height = 33;
         _loc10_.width = _loc2_;
         var _loc11_:Group;
         (_loc11_ = new Group()).width = _loc3_;
         _loc10_.addElement(_loc11_);
         _loc10_.addElement(this._6416);
         _loc10_.addElement(this._5613);
         _loc6_.addElement(_loc7_);
         var _loc12_:_13223 = new _13223();
         _loc6_.addElement(_loc12_);
         _loc6_.addElement(_loc10_);
         var _loc13_:Group = _125._2397(0);
         var _loc14_:_1189;
         (_loc14_ = _loc13_.layout as _1189)._2420 = 0;
         _loc14_._2410 = 0;
         var _loc15_:Group;
         (_loc15_ = _125._2398()).width = _loc1_;
         _loc15_.height = 33;
         var _loc16_:Label;
         (_loc16_ = new Label()).text = tr("Mesh.tool.density");
         this._13961 = new _13551();
         this._13961.maximum = 5;
         this._13961.minimum = 1;
         this._13961._8236 = 0.1;
         this._13961._8047 = 0.1;
         this._13961.width = 38;
         this._13962 = new IconButton();
         this._13962.icon = _13960;
         this._13962.toolTip = tr("Mesh.tool.autoOutline");
         _loc15_.addElement(_loc16_);
         _loc15_.addElement(this._13961);
         _loc15_.addElement(this._13962);
         var _loc17_:Group;
         (_loc17_ = new Group()).width = _loc3_;
         _loc15_.addElement(_loc17_);
         _loc13_.addElement(_loc15_);
         var _loc18_:_13223 = new _13223();
         _loc13_.addElement(_loc18_);
         var _loc19_:Group;
         (_loc19_ = _125._13692()).width = _loc2_;
         _loc19_.height = 33;
         this._11373 = new Label();
         this._11373.text = tr("Mesh.tool.info",0);
         var _loc20_:Group;
         (_loc20_ = new Group()).width = _loc3_;
         _loc19_.addElement(_loc20_);
         _loc19_.addElement(this._11373);
         _loc13_.addElement(_loc19_);
         var _loc21_:_13567 = new _13567();
         _loc4_.addElement(_loc21_);
         _loc4_.addElement(_loc6_);
         _loc21_ = new _13567();
         _loc4_.addElement(_loc21_);
         _loc4_.addElement(_loc13_);
         addElement(_loc4_);
         this.addEvent();
      }
      
      private function addEvent() : void
      {
         this._11438.addEventListener(MouseEvent.CLICK,this._2384);
         this._6417.addEventListener(MouseEvent.CLICK,this._11831);
         this._6412.addEventListener(MouseEvent.CLICK,this._4022);
         this._6419.addEventListener(MouseEvent.CLICK,this._6617);
         this._6416.addEventListener(MouseEvent.CLICK,this._3168);
         this._5613.addEventListener(MouseEvent.CLICK,this._4334);
         this._13962.addEventListener(MouseEvent.CLICK,this._13963);
         this._11649.addEventListener(Event.CHANGE,this._11830);
      }
      
      private function _2384(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CLOSE_EDIT,null,true));
      }
      
      private function _11831(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CHANGE_MODE,_11505.TOOL_MODIFY_VERTEX,true));
      }
      
      private function _4022(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CHANGE_MODE,_11505.TOOL_ADD_VERTEX,true));
      }
      
      private function _6617(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CHANGE_MODE,_11505.TOOL_DEL,true));
      }
      
      private function _3168(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CHANGE_MODE,_11505.TOOL_OUTLINE,true));
      }
      
      private function _4334(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CLICK_RESET,null,true));
      }
      
      private function _13963(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.CLICK_AUTO,int(this._13961.value),true));
      }
      
      private function _11830(param1:Event) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.DEFORM_CHANGE,this._11649.selected,true));
      }
   }
}


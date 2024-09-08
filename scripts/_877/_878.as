package _877
{
   import _1038._1037;
   import _1045.Group;
   import _1045.Label;
   import _1045.RadioButton;
   import _1045._1081;
   import _1045._1082;
   import _1177.IndexChangeEvent;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1374.IconButton;
   import _1374._1391;
   import _24._26;
   import _561._568;
   import _636.MeshEvent;
   import _639.HotkeysModel;
   import _883._882;
   import _883._884;
   import _935._934;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _878 extends Group
   {
      private static var _6410:String = "/assets/button/add_vertex.png";
      
      private static var _6411:String = "/assets/button/add_vertex.png";
      
      private static var _6420:String = "/assets/button/delete_vertex.png";
      
      private static var _6409:String = "/assets/button/edit_mesh.png";
      
      private static var _6413:String = "/assets/button/mesh_outline.png";
      
      private static var _6415:String = "/assets/button/reset_mesh.png";
      
      private var _6418:_1391;
      
      private var _6414:_1037;
      
      public var _6412:RadioButton;
      
      public var _6417:RadioButton;
      
      public var _6419:RadioButton;
      
      public var _6416:RadioButton;
      
      public var _5613:IconButton;
      
      public var radioGroup:_1081;
      
      public var _4336:Label;
      
      public function _878()
      {
         this._6414 = new _1037();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc2_:_26 = null;
         var _loc3_:_1189 = null;
         super._2438();
         var _loc1_:HotkeysModel = HotkeysModel.getInstance();
         this._6418 = new _1391();
         this._6414.source = [{
            "icon":_6409,
            "toolTip":tr("Mesh.tool.modify",_loc1_._11726(_26.MESH_EDIT)),
            "data":_568.TOOL_MODIFY_VERTEX,
            "enabled":true
         },{
            "icon":_6410,
            "toolTip":tr("Mesh.tool.add",_loc1_._11726(_26.MESH_ADD)),
            "data":_568.TOOL_ADD_VERTEX,
            "enabled":true
         },{
            "icon":_6420,
            "toolTip":tr("Mesh.tool.delete",_loc1_._11726(_26.MESH_DELETE)),
            "data":_568.TOOL_DEL,
            "enabled":true
         },{
            "icon":_6413,
            "toolTip":tr("Mesh.tool.outline"),
            "data":_568.TOOL_OUTLINE,
            "enabled":true
         }];
         this._6418.dataProvider = this._6414;
         this._6418.skinName = _882;
         this._6418.itemRenderer = _934;
         _loc3_ = new _1189();
         _loc3_._2401 = _1188.CENTER;
         _loc3_.verticalAlign = _1196.MIDDLE;
         this._4336 = new Label();
         this.radioGroup = new _1081();
         this._6412 = new RadioButton();
         this._6412.skinName = _884;
         this._6412.group = this.radioGroup;
         this._6412.label = tr("Mesh.tool.add");
         this._6412.value = _568.TOOL_ADD_VERTEX;
         this._6417 = new RadioButton();
         this._6417.skinName = _884;
         this._6417.group = this.radioGroup;
         this._6417.label = tr("Mesh.tool.modify");
         this._6417.value = _568.TOOL_MODIFY_VERTEX;
         this._6419 = new RadioButton();
         this._6419.skinName = _884;
         this._6419.group = this.radioGroup;
         this._6419.label = tr("Mesh.tool.delete");
         this._6419.value = _568.TOOL_DEL;
         this._6416 = new RadioButton();
         this._6416.skinName = _884;
         this._6416.group = this.radioGroup;
         this._6416.label = tr("Mesh.tool.outline");
         this._6416.value = _568.TOOL_OUTLINE;
         this._5613 = new IconButton();
         this._5613.icon = _6415;
         this._5613.toolTip = tr("Mesh.tool.reset");
         var _loc4_:Group;
         (_loc4_ = new Group()).percentWidth = 100;
         _loc4_.layout = _loc3_;
         _loc4_.addElement(this._6418);
         _loc4_.addElement(this._5613);
         var _loc5_:Group;
         (_loc5_ = _125._2414()).percentWidth = 100;
         this._4336.left = 2;
         _loc5_.addElement(this._4336);
         _loc5_.addElement(_loc4_);
         _loc5_.bottom = 2;
         var _loc6_:_1082;
         (_loc6_ = new _1082()).fillColor = 2830904;
         _loc6_._2564 = 0;
         _loc6_.percentWidth = 100;
         _loc6_.height = 30;
         addElement(_loc6_);
         addElement(_loc5_);
         this._6418.addEventListener(IndexChangeEvent.CHANGE,this._6408);
         this._5613.addEventListener(MouseEvent.CLICK,this._4334);
      }
      
      private function _4334(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.RESET,null,true));
      }
      
      private function _6408(param1:Event) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get _4335() : int
      {
         return this._6418.selectedIndex;
      }
      
      public function set _4335(param1:int) : void
      {
         if(this._6418.selectedIndex != param1)
         {
            this._6418.selectedIndex = param1;
         }
      }
   }
}


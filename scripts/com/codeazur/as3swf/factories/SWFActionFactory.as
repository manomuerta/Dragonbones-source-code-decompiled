package com.codeazur.as3swf.factories
{
   import com.codeazur.as3swf.data.actions.ActionUnknown;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions.swf3.ActionGetURL;
   import com.codeazur.as3swf.data.actions.swf3.ActionGotoFrame;
   import com.codeazur.as3swf.data.actions.swf3.ActionGotoLabel;
   import com.codeazur.as3swf.data.actions.swf3.ActionNextFrame;
   import com.codeazur.as3swf.data.actions.swf3.ActionPlay;
   import com.codeazur.as3swf.data.actions.swf3.ActionPreviousFrame;
   import com.codeazur.as3swf.data.actions.swf3.ActionSetTarget;
   import com.codeazur.as3swf.data.actions.swf3.ActionStop;
   import com.codeazur.as3swf.data.actions.swf3.ActionStopSounds;
   import com.codeazur.as3swf.data.actions.swf3.ActionToggleQuality;
   import com.codeazur.as3swf.data.actions.swf3.ActionWaitForFrame;
   import com.codeazur.as3swf.data.actions.swf4.ActionAdd;
   import com.codeazur.as3swf.data.actions.swf4.ActionAnd;
   import com.codeazur.as3swf.data.actions.swf4.ActionAsciiToChar;
   import com.codeazur.as3swf.data.actions.swf4.ActionCall;
   import com.codeazur.as3swf.data.actions.swf4.ActionCharToAscii;
   import com.codeazur.as3swf.data.actions.swf4.ActionCloneSprite;
   import com.codeazur.as3swf.data.actions.swf4.ActionDivide;
   import com.codeazur.as3swf.data.actions.swf4.ActionEndDrag;
   import com.codeazur.as3swf.data.actions.swf4.ActionEquals;
   import com.codeazur.as3swf.data.actions.swf4.ActionGetProperty;
   import com.codeazur.as3swf.data.actions.swf4.ActionGetTime;
   import com.codeazur.as3swf.data.actions.swf4.ActionGetURL2;
   import com.codeazur.as3swf.data.actions.swf4.ActionGetVariable;
   import com.codeazur.as3swf.data.actions.swf4.ActionGotoFrame2;
   import com.codeazur.as3swf.data.actions.swf4.ActionIf;
   import com.codeazur.as3swf.data.actions.swf4.ActionJump;
   import com.codeazur.as3swf.data.actions.swf4.ActionLess;
   import com.codeazur.as3swf.data.actions.swf4.ActionMBAsciiToChar;
   import com.codeazur.as3swf.data.actions.swf4.ActionMBCharToAscii;
   import com.codeazur.as3swf.data.actions.swf4.ActionMBStringExtract;
   import com.codeazur.as3swf.data.actions.swf4.ActionMBStringLength;
   import com.codeazur.as3swf.data.actions.swf4.ActionMultiply;
   import com.codeazur.as3swf.data.actions.swf4.ActionNot;
   import com.codeazur.as3swf.data.actions.swf4.ActionOr;
   import com.codeazur.as3swf.data.actions.swf4.ActionPop;
   import com.codeazur.as3swf.data.actions.swf4.ActionPush;
   import com.codeazur.as3swf.data.actions.swf4.ActionRandomNumber;
   import com.codeazur.as3swf.data.actions.swf4.ActionRemoveSprite;
   import com.codeazur.as3swf.data.actions.swf4.ActionSetProperty;
   import com.codeazur.as3swf.data.actions.swf4.ActionSetTarget2;
   import com.codeazur.as3swf.data.actions.swf4.ActionSetVariable;
   import com.codeazur.as3swf.data.actions.swf4.ActionStartDrag;
   import com.codeazur.as3swf.data.actions.swf4.ActionStringAdd;
   import com.codeazur.as3swf.data.actions.swf4.ActionStringEquals;
   import com.codeazur.as3swf.data.actions.swf4.ActionStringExtract;
   import com.codeazur.as3swf.data.actions.swf4.ActionStringLength;
   import com.codeazur.as3swf.data.actions.swf4.ActionStringLess;
   import com.codeazur.as3swf.data.actions.swf4.ActionSubtract;
   import com.codeazur.as3swf.data.actions.swf4.ActionToInteger;
   import com.codeazur.as3swf.data.actions.swf4.ActionTrace;
   import com.codeazur.as3swf.data.actions.swf4.ActionWaitForFrame2;
   import com.codeazur.as3swf.data.actions.swf5.ActionAdd2;
   import com.codeazur.as3swf.data.actions.swf5.ActionBitAnd;
   import com.codeazur.as3swf.data.actions.swf5.ActionBitLShift;
   import com.codeazur.as3swf.data.actions.swf5.ActionBitOr;
   import com.codeazur.as3swf.data.actions.swf5.ActionBitRShift;
   import com.codeazur.as3swf.data.actions.swf5.ActionBitURShift;
   import com.codeazur.as3swf.data.actions.swf5.ActionBitXor;
   import com.codeazur.as3swf.data.actions.swf5.ActionCallFunction;
   import com.codeazur.as3swf.data.actions.swf5.ActionCallMethod;
   import com.codeazur.as3swf.data.actions.swf5.ActionConstantPool;
   import com.codeazur.as3swf.data.actions.swf5.ActionDecrement;
   import com.codeazur.as3swf.data.actions.swf5.ActionDefineFunction;
   import com.codeazur.as3swf.data.actions.swf5.ActionDefineLocal;
   import com.codeazur.as3swf.data.actions.swf5.ActionDefineLocal2;
   import com.codeazur.as3swf.data.actions.swf5.ActionDelete;
   import com.codeazur.as3swf.data.actions.swf5.ActionDelete2;
   import com.codeazur.as3swf.data.actions.swf5.ActionEnumerate;
   import com.codeazur.as3swf.data.actions.swf5.ActionEquals2;
   import com.codeazur.as3swf.data.actions.swf5.ActionGetMember;
   import com.codeazur.as3swf.data.actions.swf5.ActionIncrement;
   import com.codeazur.as3swf.data.actions.swf5.ActionInitArray;
   import com.codeazur.as3swf.data.actions.swf5.ActionInitObject;
   import com.codeazur.as3swf.data.actions.swf5.ActionLess2;
   import com.codeazur.as3swf.data.actions.swf5.ActionModulo;
   import com.codeazur.as3swf.data.actions.swf5.ActionNewMethod;
   import com.codeazur.as3swf.data.actions.swf5.ActionNewObject;
   import com.codeazur.as3swf.data.actions.swf5.ActionPushDuplicate;
   import com.codeazur.as3swf.data.actions.swf5.ActionReturn;
   import com.codeazur.as3swf.data.actions.swf5.ActionSetMember;
   import com.codeazur.as3swf.data.actions.swf5.ActionStackSwap;
   import com.codeazur.as3swf.data.actions.swf5.ActionStoreRegister;
   import com.codeazur.as3swf.data.actions.swf5.ActionTargetPath;
   import com.codeazur.as3swf.data.actions.swf5.ActionToNumber;
   import com.codeazur.as3swf.data.actions.swf5.ActionToString;
   import com.codeazur.as3swf.data.actions.swf5.ActionTypeOf;
   import com.codeazur.as3swf.data.actions.swf5.ActionWith;
   import com.codeazur.as3swf.data.actions.swf6.ActionEnumerate2;
   import com.codeazur.as3swf.data.actions.swf6.ActionGreater;
   import com.codeazur.as3swf.data.actions.swf6.ActionInstanceOf;
   import com.codeazur.as3swf.data.actions.swf6.ActionStrictEquals;
   import com.codeazur.as3swf.data.actions.swf6.ActionStringGreater;
   import com.codeazur.as3swf.data.actions.swf7.ActionCastOp;
   import com.codeazur.as3swf.data.actions.swf7.ActionDefineFunction2;
   import com.codeazur.as3swf.data.actions.swf7.ActionExtends;
   import com.codeazur.as3swf.data.actions.swf7.ActionImplementsOp;
   import com.codeazur.as3swf.data.actions.swf7.ActionThrow;
   import com.codeazur.as3swf.data.actions.swf7.ActionTry;
   
   public class SWFActionFactory
   {
      public function SWFActionFactory()
      {
         super();
      }
      
      public static function create(param1:uint, param2:uint, param3:uint) : IAction
      {
         switch(param1)
         {
            case ActionNextFrame.CODE:
               return new ActionNextFrame(param1,param2,param3);
            case ActionPreviousFrame.CODE:
               return new ActionPreviousFrame(param1,param2,param3);
            case ActionPlay.CODE:
               return new ActionPlay(param1,param2,param3);
            case ActionStop.CODE:
               return new ActionStop(param1,param2,param3);
            case ActionToggleQuality.CODE:
               return new ActionToggleQuality(param1,param2,param3);
            case ActionStopSounds.CODE:
               return new ActionStopSounds(param1,param2,param3);
            case ActionAdd.CODE:
               return new ActionAdd(param1,param2,param3);
            case ActionSubtract.CODE:
               return new ActionSubtract(param1,param2,param3);
            case ActionMultiply.CODE:
               return new ActionMultiply(param1,param2,param3);
            case ActionDivide.CODE:
               return new ActionDivide(param1,param2,param3);
            case ActionEquals.CODE:
               return new ActionEquals(param1,param2,param3);
            case ActionLess.CODE:
               return new ActionLess(param1,param2,param3);
            case ActionAnd.CODE:
               return new ActionAnd(param1,param2,param3);
            case ActionOr.CODE:
               return new ActionOr(param1,param2,param3);
            case ActionNot.CODE:
               return new ActionNot(param1,param2,param3);
            case ActionStringEquals.CODE:
               return new ActionStringEquals(param1,param2,param3);
            case ActionStringLength.CODE:
               return new ActionStringLength(param1,param2,param3);
            case ActionStringExtract.CODE:
               return new ActionStringExtract(param1,param2,param3);
            case ActionPop.CODE:
               return new ActionPop(param1,param2,param3);
            case ActionToInteger.CODE:
               return new ActionToInteger(param1,param2,param3);
            case ActionGetVariable.CODE:
               return new ActionGetVariable(param1,param2,param3);
            case ActionSetVariable.CODE:
               return new ActionSetVariable(param1,param2,param3);
            case ActionSetTarget2.CODE:
               return new ActionSetTarget2(param1,param2,param3);
            case ActionStringAdd.CODE:
               return new ActionStringAdd(param1,param2,param3);
            case ActionGetProperty.CODE:
               return new ActionGetProperty(param1,param2,param3);
            case ActionSetProperty.CODE:
               return new ActionSetProperty(param1,param2,param3);
            case ActionCloneSprite.CODE:
               return new ActionCloneSprite(param1,param2,param3);
            case ActionRemoveSprite.CODE:
               return new ActionRemoveSprite(param1,param2,param3);
            case ActionTrace.CODE:
               return new ActionTrace(param1,param2,param3);
            case ActionStartDrag.CODE:
               return new ActionStartDrag(param1,param2,param3);
            case ActionEndDrag.CODE:
               return new ActionEndDrag(param1,param2,param3);
            case ActionStringLess.CODE:
               return new ActionStringLess(param1,param2,param3);
            case ActionThrow.CODE:
               return new ActionThrow(param1,param2,param3);
            case ActionCastOp.CODE:
               return new ActionCastOp(param1,param2,param3);
            case ActionImplementsOp.CODE:
               return new ActionImplementsOp(param1,param2,param3);
            case ActionRandomNumber.CODE:
               return new ActionRandomNumber(param1,param2,param3);
            case ActionMBStringLength.CODE:
               return new ActionMBStringLength(param1,param2,param3);
            case ActionCharToAscii.CODE:
               return new ActionCharToAscii(param1,param2,param3);
            case ActionAsciiToChar.CODE:
               return new ActionAsciiToChar(param1,param2,param3);
            case ActionGetTime.CODE:
               return new ActionGetTime(param1,param2,param3);
            case ActionMBStringExtract.CODE:
               return new ActionMBStringExtract(param1,param2,param3);
            case ActionMBCharToAscii.CODE:
               return new ActionMBCharToAscii(param1,param2,param3);
            case ActionMBAsciiToChar.CODE:
               return new ActionMBAsciiToChar(param1,param2,param3);
            case ActionDelete.CODE:
               return new ActionDelete(param1,param2,param3);
            case ActionDelete2.CODE:
               return new ActionDelete2(param1,param2,param3);
            case ActionDefineLocal.CODE:
               return new ActionDefineLocal(param1,param2,param3);
            case ActionCallFunction.CODE:
               return new ActionCallFunction(param1,param2,param3);
            case ActionReturn.CODE:
               return new ActionReturn(param1,param2,param3);
            case ActionModulo.CODE:
               return new ActionModulo(param1,param2,param3);
            case ActionNewObject.CODE:
               return new ActionNewObject(param1,param2,param3);
            case ActionDefineLocal2.CODE:
               return new ActionDefineLocal2(param1,param2,param3);
            case ActionInitArray.CODE:
               return new ActionInitArray(param1,param2,param3);
            case ActionInitObject.CODE:
               return new ActionInitObject(param1,param2,param3);
            case ActionTypeOf.CODE:
               return new ActionTypeOf(param1,param2,param3);
            case ActionTargetPath.CODE:
               return new ActionTargetPath(param1,param2,param3);
            case ActionEnumerate.CODE:
               return new ActionEnumerate(param1,param2,param3);
            case ActionAdd2.CODE:
               return new ActionAdd2(param1,param2,param3);
            case ActionLess2.CODE:
               return new ActionLess2(param1,param2,param3);
            case ActionEquals2.CODE:
               return new ActionEquals2(param1,param2,param3);
            case ActionToNumber.CODE:
               return new ActionToNumber(param1,param2,param3);
            case ActionToString.CODE:
               return new ActionToString(param1,param2,param3);
            case ActionPushDuplicate.CODE:
               return new ActionPushDuplicate(param1,param2,param3);
            case ActionStackSwap.CODE:
               return new ActionStackSwap(param1,param2,param3);
            case ActionGetMember.CODE:
               return new ActionGetMember(param1,param2,param3);
            case ActionSetMember.CODE:
               return new ActionSetMember(param1,param2,param3);
            case ActionIncrement.CODE:
               return new ActionIncrement(param1,param2,param3);
            case ActionDecrement.CODE:
               return new ActionDecrement(param1,param2,param3);
            case ActionCallMethod.CODE:
               return new ActionCallMethod(param1,param2,param3);
            case ActionNewMethod.CODE:
               return new ActionNewMethod(param1,param2,param3);
            case ActionInstanceOf.CODE:
               return new ActionInstanceOf(param1,param2,param3);
            case ActionEnumerate2.CODE:
               return new ActionEnumerate2(param1,param2,param3);
            case ActionBitAnd.CODE:
               return new ActionBitAnd(param1,param2,param3);
            case ActionBitOr.CODE:
               return new ActionBitOr(param1,param2,param3);
            case ActionBitXor.CODE:
               return new ActionBitXor(param1,param2,param3);
            case ActionBitLShift.CODE:
               return new ActionBitLShift(param1,param2,param3);
            case ActionBitRShift.CODE:
               return new ActionBitRShift(param1,param2,param3);
            case ActionBitURShift.CODE:
               return new ActionBitURShift(param1,param2,param3);
            case ActionStrictEquals.CODE:
               return new ActionStrictEquals(param1,param2,param3);
            case ActionGreater.CODE:
               return new ActionGreater(param1,param2,param3);
            case ActionStringGreater.CODE:
               return new ActionStringGreater(param1,param2,param3);
            case ActionExtends.CODE:
               return new ActionExtends(param1,param2,param3);
            case ActionGotoFrame.CODE:
               return new ActionGotoFrame(param1,param2,param3);
            case ActionGetURL.CODE:
               return new ActionGetURL(param1,param2,param3);
            case ActionStoreRegister.CODE:
               return new ActionStoreRegister(param1,param2,param3);
            case ActionConstantPool.CODE:
               return new ActionConstantPool(param1,param2,param3);
            case ActionWaitForFrame.CODE:
               return new ActionWaitForFrame(param1,param2,param3);
            case ActionSetTarget.CODE:
               return new ActionSetTarget(param1,param2,param3);
            case ActionGotoLabel.CODE:
               return new ActionGotoLabel(param1,param2,param3);
            case ActionWaitForFrame2.CODE:
               return new ActionWaitForFrame2(param1,param2,param3);
            case ActionDefineFunction2.CODE:
               return new ActionDefineFunction2(param1,param2,param3);
            case ActionTry.CODE:
               return new ActionTry(param1,param2,param3);
            case ActionWith.CODE:
               return new ActionWith(param1,param2,param3);
            case ActionPush.CODE:
               return new ActionPush(param1,param2,param3);
            case ActionJump.CODE:
               return new ActionJump(param1,param2,param3);
            case ActionGetURL2.CODE:
               return new ActionGetURL2(param1,param2,param3);
            case ActionDefineFunction.CODE:
               return new ActionDefineFunction(param1,param2,param3);
            case ActionIf.CODE:
               return new ActionIf(param1,param2,param3);
            case ActionCall.CODE:
               return new ActionCall(param1,param2,param3);
            case ActionGotoFrame2.CODE:
               return new ActionGotoFrame2(param1,param2,param3);
            default:
               return new ActionUnknown(param1,param2,param3);
         }
      }
   }
}


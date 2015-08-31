//
//  Extensions.swift
//  Dynamic
//
//  Created by Bradley Hilton on 7/20/15.
//  Copyright © 2015 Skyvive. All rights reserved.
//


/// Structures

extension AnyBidirectionalCollection : Property {}
extension AnyBidirectionalIndex : Property {}
extension AnyForwardCollection : Property {}
extension AnyForwardIndex : Property {}
extension AnyRandomAccessCollection : Property {}
extension AnyRandomAccessIndex : Property {}
extension AnySequence : Property {}
extension Array : Property {}
extension ArraySlice : Property {}
extension AutoreleasingUnsafeMutablePointer : Property {}
extension Bool : Property {}
extension COpaquePointer : Property {}
extension CVaListPointer : Property {}
extension Character : Property {}
extension ClosedInterval : Property {}
extension CollectionOfOne : Property {}
extension ContiguousArray : Property {}
extension Dictionary : Property {}
extension DictionaryGenerator : Property {}
extension DictionaryIndex : Property {}
extension DictionaryLiteral : Property {}
extension Double : Property {}
extension EmptyCollection : Property {}
extension EmptyGenerator : Property {}
extension EnumerateGenerator : Property {}
extension EnumerateSequence : Property {}
extension FlattenBidirectionalCollection : Property {}
extension FlattenBidirectionalCollectionIndex : Property {}
extension FlattenCollection : Property {}
extension FlattenCollectionIndex : Property {}
extension FlattenGenerator : Property {}
extension FlattenSequence : Property {}
extension Float : Property {}
extension GeneratorOfOne : Property {}
extension GeneratorSequence : Property {}
extension HalfOpenInterval : Property {}
extension IndexingGenerator : Property {}
extension Int : Property {}
extension Int16 : Property {}
extension Int32 : Property {}
extension Int64 : Property {}
extension Int8 : Property {}
extension JoinGenerator : Property {}
extension JoinSequence : Property {}
extension LazyCollection : Property {}
extension LazyFilterCollection : Property {}
extension LazyFilterGenerator : Property {}
extension LazyFilterIndex : Property {}
extension LazyFilterSequence : Property {}
extension LazyMapCollection : Property {}
extension LazyMapGenerator : Property {}
extension LazyMapSequence : Property {}
extension LazySequence : Property {}
extension ManagedBufferPointer : Property {}
extension Mirror : Property {}
extension MutableSlice : Property {}
extension ObjectIdentifier : Property {}
extension PermutationGenerator : Property {}
extension Range : Property {}
extension RangeGenerator : Property {}
extension RawByte : Property {}
extension Repeat : Property {}
extension ReverseCollection : Property {}
extension ReverseIndex : Property {}
extension ReverseRandomAccessCollection : Property {}
extension ReverseRandomAccessIndex : Property {}
extension Set : Property {}
extension SetGenerator : Property {}
extension SetIndex : Property {}
extension Slice : Property {}
extension StaticString : Property {}
extension StrideThrough : Property {}
extension StrideThroughGenerator : Property {}
extension StrideTo : Property {}
extension StrideToGenerator : Property {}
extension String : Property {}
extension String.CharacterView : Property {}
extension String.CharacterView.Index : Property {}
extension String.UTF16View : Property {}
extension String.UTF16View.Index : Property {}
extension String.UTF8View : Property {}
extension String.UTF8View.Index : Property {}
extension String.UnicodeScalarView : Property {}
extension String.UnicodeScalarView.Generator : Property {}
extension String.UnicodeScalarView.Index : Property {}
extension UInt : Property {}
extension UInt16 : Property {}
extension UInt32 : Property {}
extension UInt64 : Property {}
extension UInt8 : Property {}
extension UTF16 : Property {}
extension UTF32 : Property {}
extension UTF8 : Property {}
extension UnicodeScalar : Property {}
extension Unmanaged : Property {}
extension UnsafeBufferPointer : Property {}
extension UnsafeBufferPointerGenerator : Property {}
extension UnsafeMutableBufferPointer : Property {}
extension UnsafeMutablePointer : Property {}
extension UnsafePointer : Property {}
extension Zip2Generator : Property {}
extension Zip2Sequence : Property {}

/// Enumerations

extension Bit : Property {}
extension FloatingPointClassification : Property {}
extension ImplicitlyUnwrappedOptional : Property {}
extension Mirror.AncestorRepresentation : Property {}
extension Mirror.DisplayStyle : Property {}
extension Optional : Property {}
extension PlaygroundQuickLook : Property {}
extension Process : Property {}
extension UnicodeDecodingResult : Property {}

/// Classes

extension AnyGenerator : Property {}
extension NonObjectiveCBase : Property {}
extension NSObject : Property {}
extension VaListBuilder : Property {}
